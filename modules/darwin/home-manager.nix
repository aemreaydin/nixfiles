{ config, pkgs, lib, home-manager, ... }:

let
  user = "emreaydn";
in
{
  imports = [
    ./dock
  ];

  # It me
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    users.${user} = { pkgs, config, lib, ... }: {
      home = {
        sessionVariables = {
          EDITOR = "nvim";
          TERMINAL = "wezterm";
        };
        enableNixpkgsReleaseCheck = false;
        packages = pkgs.callPackage ./packages.nix { };
        file = {
          ".config/wezterm" = { source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixfiles/wezterm"; };
          ".config/nvim" = { source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixfiles/nvim"; };
        };
        stateVersion = "24.05";
      };
      programs = {
        neovim = {
          enable = true;
          viAlias = true;
          vimAlias = true;
          defaultEditor = true;
        };
      } // import ../shared/home-manager.nix { inherit config pkgs lib; };
    };
  };

  # Fully declarative dock using the latest from Nix Store
  local.dock.enable = true;
  local.dock.entries = [
    { path = "/Applications/Arc.app/"; }
    { path = "~/Applications/Home Manager Apps/WezTerm.app/"; }
    { path = "~/Applications/Home Manager Apps/Bruno.app/"; }
    { path = "/Applications/Sofa.app/"; }
    { path = "/Applications/GeForceNOW.app/"; }
    { path = "/System/Applications/Books.app/"; }
  ];

}
