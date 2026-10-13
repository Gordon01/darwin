nix-darwin Configuration

This is a [nix-darwin](https://github.com/nix-darwin/nix-darwin) configuration for macOS (aarch64-darwin) managed via Nix flake. Key details:

## Structure
```
├── darwin/         # System config
├── home/           # Home Manager
├── modules/        # Shared flake modules
├── flake.nix      # Main flake definition
└── flake.lock      # Lock file
```

## Quick Start
1. Clone repo
2. Install [Determinate Nix](https://github.com/DeterminateSystems/nix-installer)
3. Run `nix flake check`
4. Deploy with `darwin-rebuild switch`

## Key Features
- **System**: Desktop environment, Finder settings
- **Tools**: Git, Vim, tmux, Nix, Starship prompt
- **Shell**: Zsh with Direnv, Television, Nix Search TV
- **MLX**: Local LLM server via MCP

## Nix Management
- Nix is managed externally; `nix.enable = false` in flake.nix
- Home Manager uses `useGlobalPkgs = true` and `useUserPackages = true`

## Development
- `nix develop` for shell
- `nix fmt` for code formatting
- `nix flake check` for validation

## GUI Customizations
- Finder shows all files/extensions
- Path/status bars enabled
- Touch ID for sudo

## Package Management
- System packages: `darwin/` directory
- User packages: `home/` directory

For package additions, edit the appropriate module in `darwin/` or `home/`.