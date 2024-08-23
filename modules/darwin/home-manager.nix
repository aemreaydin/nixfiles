{ config, pkgs, lib, home-manager, ... }:

let
  user = "emreaydn";
  additionalFiles = import ./files.nix { inherit user config pkgs; };
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
        enableNixpkgsReleaseCheck = false;
        packages = pkgs.callPackage ./packages.nix { };
        file = lib.mkMerge [
        ];
        stateVersion = "24.05";
      };
      file = {
        ".config/kitty" = { source = config.lib.file.mkOutOfStoreSymlink ../../kitty; };
        ".config/nvim" = { source = config.lib.file.mkOutOfStoreSymlink ../../nvim; };
      };
      programs = {
        lazygit = { enable = true; };
        neovim = {
          enable = true;
          viAlias = true;
          vimAlias = true;
          defaultEditor = true;
        };
        kitty = {
          enable = true;
        };
        ranger = { enable = true; };
        ripgrep = { enable = true; };
        fzf = { enable = true; };
        zoxide = { enable = true; };
        lsd = { enable = true; };
        bat = { enable = true; };
        go = { enable = true; };
      } // import ../shared/home-manager.nix { inherit config pkgs lib; };
    };
  };

  # Fully declarative dock using the latest from Nix Store
  local.dock.enable = true;
  local.dock.entries = [
    { path = "/Applications/Arc.app/"; }
    { path = "/Applications/Sofa.app/"; }
    { path = "/Applications/Diversion.app/"; }
    { path = "/Applications/GoLand.app/"; }
    { path = "/Applications/Unity Hub.app/"; }
    {
      path = "${config.users.users.${user}.home}/.local/share/";
      section = "others";
      options = "--sort name --view grid --display folder";
    }
    {
      path = "${config.users.users.${user}.home}/.local/share/downloads";
      section = "others";
      options = "--sort name --view grid --display stack";
    }
  ];

}
