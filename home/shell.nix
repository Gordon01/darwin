{ inputs, ... }:
{
  flake.homeModules.shell =
    { pkgs, ... }:
    {
      imports = [ inputs.nix-index-database.homeModules.nix-index ];

      home.packages = [
        pkgs.uv
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
      };
    };
}
