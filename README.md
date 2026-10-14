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

## Open WebUI

Open WebUI runs automatically as a launch agent after applying the
configuration. Open <http://127.0.0.1:3000> in a browser. Its data and static
files are stored in `~/.local/share/open-webui`.

The service logs to `~/Library/Logs/open-webui.log`.
The `open-webui` command is the nixpkgs binary with the persistent data
environment configured; use `open-webui-server` to run the server manually.

Use these aliases to stop and restart it:

```sh
open-webui-stop
open-webui-start
```

## MLX language model server

The launch agent is loaded but does not start automatically. Use these aliases:

```sh
mlx-lm-start
mlx-lm-stop
```

To run it in the foreground instead, use `mlx-lm-server` and stop with Ctrl-C.
