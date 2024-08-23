{ pkgs }:

with pkgs; [
  # General packages for development and system management
  raycast
  lazygit
  ripgrep
  vscode
  fzf
  zoxide
  cmake
  kitty
  ninja
  tree-sitter
  bat
  go
  btop
  neofetch
  openssh
  sqlite
  wget
  zip
  killall
  htop
  jetbrains-mono
  jq
  unrar
  unzip
  zsh-powerlevel10k
  ranger

  jetbrains.goland
  # alacritty
  # aspell
  # aspellDicts.en
  # bash-completion
  # bat
  # coreutils

  # Encryption and security tools
  # age
  # age-plugin-yubikey
  # gnupg
  # libfido2

  # Cloud-related tools and SDKs
  # docker
  # docker-compose

  # Media-related packages
  # emacs-all-the-icons-fonts
  # dejavu_fonts
  # ffmpeg
  # fd
  # font-awesome
  # hack-font
  # noto-fonts
  # noto-fonts-emoji
  # meslo-lgs-nf

  # Node.js development tools
  nodePackages.npm # globally install npm
  nodePackages.prettier
  nodejs
  python3
]
