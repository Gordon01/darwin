{ ... }:
{
  flake.homeModules.ai = { pkgs, ... }: {
    home.packages = [
      pkgs.open-webui
      (pkgs.writeShellApplication {
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
      })
    ];

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
