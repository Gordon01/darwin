## Quick start

Build the Darwin configuration:

```sh
NIXPKGS_ALLOW_UNFREE=1 darwin-rebuild build --flake .#Gordon01-MB --impure
```

The `NIXPKGS_ALLOW_UNFREE=1` flag is required because `open-webui` is marked as an unfree package.

To apply the configuration to the machine, run:

```sh
sudo env NIXPKGS_ALLOW_UNFREE=1 darwin-rebuild switch --flake . --impure
```

## Open WebUI

Open WebUI is configured to run as a launch agent after the system configuration is applied. Open <http://127.0.0.1:3000> in a browser to access it. Its persistent data and static files live in `~/.local/share/open-webui`.

The service logs are written to `~/Library/Logs/open-webui.log`.
The `open-webui` command is the nixpkgs binary configured with the persistent data environment. To run the server manually, use `open-webui-server`.

Use these aliases to stop and restart the service:

```sh
open-webui-stop
open-webui-start
```

## MLX language model server

The launch agent is loaded but does not start automatically. Use these aliases to control it:

```sh
mlx-lm-start
mlx-lm-stop
```

To run it in the foreground instead, use `mlx-lm-server` and stop it with Ctrl-C.
