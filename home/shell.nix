{ inputs, ... }:
{
  flake.homeModules.shell =
    {
      config,
      pkgs,
      ...
    }:
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
      mlxServerLog = "${config.home.homeDirectory}/Library/Logs/mlx-lm-server.log";
    in
    {
      imports = [ inputs.nix-index-database.homeModules.nix-index ];

      home.packages = [
        pkgs.uv
        pythonMlx
      ];

      launchd.agents.mlx-lm-server = {
        enable = true;
        config = {
          ProgramArguments = [
            "${pythonMlx}/bin/python-mlx"
            "python"
            "-m"
            "mlx_lm.server"
            "--model"
            "mlx-community/Qwen3-8B-4bit"
          ];
          RunAtLoad = false;
          KeepAlive = false;
          StandardOutPath = mlxServerLog;
          StandardErrorPath = mlxServerLog;
          EnvironmentVariables.HOME = config.home.homeDirectory;
        };
      };

      programs = {
        ghostty = {
          enable = true;
          package = pkgs.ghostty-bin;
          enableZshIntegration = true;
        };
        nix-index-database.comma.enable = true;

        direnv = {
          enable = true;
          enableZshIntegration = true;
        };
        starship = {
          enable = true;
          enableZshIntegration = true;
        };
        zsh = {
          enable = true;
          enableCompletion = true;
          autosuggestion.enable = true;
          syntaxHighlighting.enable = true;
        };

        television = {
          enable = true;
          enableZshIntegration = true;
        };
        nix-search-tv = {
          enable = true;
          enableTelevisionIntegration = true;
        };

        opencode = {
          enable = true;
          settings = {
            model = "mlx/mlx-community/Qwen3-8B-4bit";
            provider.mlx = {
              npm = "@ai-sdk/openai-compatible";
              name = "MLX LM Server";
              options.baseURL = "http://127.0.0.1:8080/v1";
              models."mlx-community/Qwen3-8B-4bit".name = "Qwen3 8B (4-bit)";
            };
          };
        };
      };
    };
}
