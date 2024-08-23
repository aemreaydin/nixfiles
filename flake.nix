{
  description = "emreaydn Configuration for MacOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { self, darwin, nixpkgs, home-manager } @inputs:
    let
      user = "emreaydn";
      linuxSystems = [ "x86_64-linux" "aarch64-linux" ];
      darwinSystems = [ "aarch64-darwin" "x86_64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs (linuxSystems ++ darwinSystems) f;
      devShell = system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        {
          default = with pkgs; mkShell {
            nativeBuildInputs = with pkgs; [ bashInteractive git ];
            shellHook = with pkgs; ''
              export EDITOR=nvim
            '';
          };
        };
      mkApp = scriptName: system: {
        type = "app";
        program = "${(nixpkgs.legacyPackages.${system}.writeScriptBin scriptName ''
          #!/usr/bin/env bash
          PATH=${nixpkgs.legacyPackages.${system}.git}/bin:$PATH
          echo "Running ${scriptName} for ${system}"
          exec ${self}/apps/${system}/${scriptName}
        '')}/bin/${scriptName}";
      };
      mkDarwinApps = system: {
        "apply" = mkApp "apply" system;
        "build" = mkApp "build" system;
        "build-switch" = mkApp "build-switch" system;
        "rollback" = mkApp "rollback" system;
      };
    in
    {
      devShells = forAllSystems devShell;
      apps = nixpkgs.lib.genAttrs darwinSystems mkDarwinApps;
      darwinConfigurations = nixpkgs.lib.genAttrs darwinSystems (system:
        let
          user = "emreaydn";
        in
        darwin.lib.darwinSystem {
          inherit system;
          specialArgs = inputs;
          modules = [
            home-manager.darwinModules.home-manager
            ./hosts/darwin
          ];
        }
      );
    };
}
