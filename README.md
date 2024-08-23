### NixOS and Home Manager Configuration

#### Installation
1. Install nixos and home manager, restart terminal
```sh
./install.sh
```

2. Apply user settings to Nix
```sh
nix run .#apply
```

3. Build nix
```sh
nix run .#build
```

4. Switch configuration
```sh
nix run .#build-switch
```
