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
