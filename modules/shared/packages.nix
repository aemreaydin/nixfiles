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
  python3
  nodejs
  nodePackages.npm
  nodePackages.prettier
  (pkgs.writeShellScriptBin "rust" ''
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  '')

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
  tree-sitter

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
