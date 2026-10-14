# nix-darwin

## Quick start

Build the configuration for this Mac:

```sh
NIXPKGS_ALLOW_UNFREE=1 darwin-rebuild build --flake .#Gordon01-MB --impure
```

The unfree opt-in is needed for `open-webui`; `--impure` allows Nix to read the
environment variable when evaluating the flake.

To apply the configuration, run:

```sh
sudo env NIXPKGS_ALLOW_UNFREE=1 darwin-rebuild switch --flake . --impure
```

## MLX language model server

The launch agent is loaded but does not start automatically. Use these aliases:

```sh
mlx-lm-start
mlx-lm-stop
```

To run it in the foreground instead, use `mlx-lm-server` and stop with Ctrl-C.
