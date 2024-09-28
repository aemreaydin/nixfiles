{ config, pkgs, lib, ... }:

let
  name = "Emre AYDIN";
  user = "emreaydn";
  email = "aeaydin1@gmail.com";
in
{
  zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
    };
    enableCompletion = true;
    autocd = false;
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./config;
        file = "p10k.zsh";
      }
    ];
    initExtraFirst = ''
      if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
        . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
        . /nix/var/nix/profiles/default/etc/profile.d/nix.sh
      fi

      # Define variables for directories
      export PATH=$HOME/.pnpm-packages/bin:$HOME/.pnpm-packages:$PATH
      export PATH=$HOME/.npm-packages/bin:$HOME/bin:$PATH
      export PATH=$HOME/.local/share/bin:$PATH
      export PATH=$HOME/.cargo/bin:$PATH

      # Remove history data we don't want to see
      export HISTIGNORE="pwd:ls:cd"

      export EDITOR="nvim"

      alias cd=z

      alias gs="git status"
      alias gc="git commit"
      alias gpush="git push"
      alias ga="git add"
      alias gall="git add ."
      alias gpull="git pull"
      alias gd="git diff"
      alias gb="git branch"
      alias gch="git checkout"
      alias gchb="git checkout -b"
      alias gsh="git show"
      alias gt="git log --graph --full-history --all --color --tags --decorate --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
    '';

    initExtra = ''
      bindkey '^ ' autosuggest-accept
      bindkey '^h' backward-word
      bindkey '^l' forward-word
    '';
  };

  zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  lsd = {
    enable = true;
    enableAliases = true;
  };

  vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      golang.go
      vscodevim.vim
    ];
  };

  git = {
    enable = true;
    ignores = [ "*.swp" ];
    userName = name;
    userEmail = email;
    lfs = {
      enable = true;
    };
    aliases = {
      st = "status";
      co = "checkout";
      l = "log --graph --full-history --all --color --tags --decorate";
    };
    extraConfig = {
      init.defaultBranch = "main";
      core = {
        editor = "vim";
        autocrlf = "input";
      };
      pull.rebase = true;
      rebase.autoStash = true;
    };
  };
}
