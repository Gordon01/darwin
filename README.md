# nix-darwin

Nix flake configuration for Alexander Sergeev's MacBook (codenamed **Gordon01-MB**).

This repository defines a reproducible macOS development environment using [Nix](https://nixos.org), [nix-darwin](https://github.com/nix-darwin/nix-darwin), and [Home Manager](https://github.com/nix-community/home-manager).

## Features

- **Declarative system config** via nix-darwin (Finder prefs, screenshot location, Touch ID for sudo, etc.)
- **User-level config** via Home Manager (zsh, git, tmux, dev tools, AI tooling)
- **Modular structure** using [flake-parts](https://flake.parts)
- **Code formatting** with [treefmt](https://github.com/numtide/treefmt-nix)
- **Local LLM support** via MLX with a custom `python-mlx` wrapper script
- **AI coding agent** configured for OpenCode with local MLX models

## Structure

```
├── flake.nix          # Entry point — defines inputs and imports
├── darwin/            # nix-darwin system configuration
│   ├── gordon01.nix   # Main system config (vim, tmux, git, Touch ID, etc.)
│   └── gui.nix        # GUI customizations (Finder, screenshots)
├── home/              # Home Manager user configuration
│   ├── gordon01.nix   # User config (git, tmux, dev tools)
│   └── shell.nix      # Shell environment (zsh, starship, direnv, ghostty, etc.)
├── modules/           # Shared modules
│   └── treefmt.nix    # Code formatting configuration
├── keys/              # SSH keys
└── skills/            # Custom OpenCode skills
```

## Requirements

- macOS on Apple Silicon (`aarch64-darwin`)
- [Nix](https://nixos.org) installed (via Determinate Nix installer)
- Git

## Usage

### Apply configuration

```bash
sudo nix flake apply
```

### Check formatting

```bash
nix flake check
```

### Update inputs

```bash
nix flake update
```

## Custom Tools

### python-mlx

A wrapper script for running MLX models locally:

```bash
python-mlx  # Drops into a zsh shell with mlx-lm available
python-mlx python script.py  # Runs a Python script with mlx-lm
```

### OpenCode

Configured with local MLX models:
- `mlx-community/Qwen3-Coder-Next-4bit`
- `mlx-community/Laguna-S-2.1-OptiQ-2bit`

## Notes

- Nix is managed outside nix-darwin by the Determinate Nix installer (`nix.enable = false`)
- System state version is pinned to 6
- Touch ID is enabled for sudo authentication
- Uses `useGlobalPkgs` and `useUserPackages` for Home Manager