{ inputs, ... }:
{
  flake.homeModules.shell =
    { pkgs, ... }:
    {
      imports = [ inputs.nix-index-database.homeModules.nix-index ];

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
          shellAliases = {
            open-webui-server = "open-webui serve --host 127.0.0.1 --port 3000";
            open-webui-start = "launchctl kickstart gui/$(id -u)/com.alex.open-webui";
            open-webui-stop = "launchctl kill SIGTERM gui/$(id -u)/com.alex.open-webui";
            mlx-lm-start = "launchctl kickstart gui/$(id -u)/com.alex.mlx-lm-server";
            mlx-lm-stop = "launchctl kill SIGTERM gui/$(id -u)/com.alex.mlx-lm-server";
          };
        };
        fzf = {
          enable = true;
          defaultOptions = [
            "--height 40%"
            "--border rounded"
          ];
        };
      };
    };
}
