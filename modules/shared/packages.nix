{ pkgs }:

with pkgs; [
  # Progrmming Tools and Languages
  cmake
  ninja
  go
  sqlite
  go-task
  sqlc
  vcpkg
  #Rust
  rustup
  cargo-cache
  cargo-deb
  cargo-license
  cargo-limit
  cargo-make
  cargo-modules
  cargo-outdated
  cargo-udeps
  cargo-watch
  cargo-expand
  cargo-shuttle
  # Python
  # python312.withPackages
  # (python-pkgs: with python-pkgs; [
  #   pip
  # ])
  # Node
  nodejs
  nodePackages.npm
  nodePackages.prettier

  # Version Control and Git Tools
  lazygit

  # Text Editors and IDEs
  vscode
  jetbrains.goland

  # Terminal Emulators and Enhancements
  wezterm

  # Shell and Command-Line Utilities
  bashInteractive
  thefuck
  oh-my-zsh
  fzf
  zoxide
  ripgrep
  bat
  ranger
  jq
  jd-diff-patch
  tree-sitter
  gnupg

  # System Monitoring and Management
  btop
  neofetch
  htop
  killall

  # File Management and Compression
  zip
  unzip
  unrar

  # Network Tools
  wget
  openssh

  # API Development and Testing
  bruno
  hurl

  # Graphics and Game Development
  vulkan-loader
  vulkan-volk
  glfw

  # Fonts
  jetbrains-mono

  # Productivity and Note-taking
  obsidian

  # Communication
  discord

  # Application Launchers
  raycast
]
