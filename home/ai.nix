{ ... }:
{
  flake.homeModules.ai =
    { config, pkgs, ... }:
    let
      pythonMlx = pkgs.writeShellApplication {
        name = "python-mlx";
        runtimeInputs = [
          pkgs.uv
          pkgs.zsh
        ];
        text = ''
          uv_args=(run --no-project --with mlx-lm --python 3.14 --managed-python)

          if (( $# > 0 )); then
            exec uv "''${uv_args[@]}" "$@"
          fi

          exec uv "''${uv_args[@]}" zsh -i
        '';
      };
      mlxLmServer = pkgs.writeShellApplication {
        name = "mlx-lm-server";
        runtimeInputs = [ pythonMlx ];
        text = ''
          exec python-mlx -m mlx_lm server "$@"
        '';
      };
    in
    {
      home.packages = [
        pkgs.open-webui
        pythonMlx
        mlxLmServer
      ];

      launchd.agents.mlx-lm-server = {
        enable = true;
        config = {
          Label = "com.alex.mlx-lm-server";
          ProgramArguments = [
            "${mlxLmServer}/bin/mlx-lm-server"
          ];
          RunAtLoad = false;
          KeepAlive = false;
          StandardOutPath = "${config.home.homeDirectory}/Library/Logs/mlx-lm-server.log";
          StandardErrorPath = "${config.home.homeDirectory}/Library/Logs/mlx-lm-server.log";
        };
      };

      programs.opencode = {
        enable = true;
        settings = {
          model = "mlx/mlx-community/Qwen3-Coder-Next-4bit";
          provider.mlx = {
            npm = "@ai-sdk/openai-compatible";
            name = "MacBook";
            options.baseURL = "http://127.0.0.1:8080/v1";
            models = {
              "mlx-community/Qwen3-Coder-Next-4bit".name = "Qwen3-Coder-Next";
              "mlx-community/Qwen3.5-REAP-97B-A10B-4bit".name = "Qwen3.5-REAP-97B";
              "mlx-community/Laguna-S-2.1-OptiQ-2bit".name = "Laguna-S-2.1-OptiQ";
            };
          };
        };
      };
    };
}
