{ inputs, ... }:
{
  flake.homeModules.shell =
    { pkgs, ... }:
    {
      imports = [ inputs.nix-index-database.homeModules.nix-index ];

      programs = {
        direnv = {
          enable = true;
          enableZshIntegration = true;
        };
        ghostty = {
          enable = true;
          package = pkgs.ghostty-bin;
          enableZshIntegration = true;
        };
        nix-index-database.comma.enable = true;
        starship = {
          enable = true;
          enableZshIntegration = true;
        };
        television = {
          enable = true;
          enableZshIntegration = true;
        };
        zsh = {
          enable = true;
          enableCompletion = true;
          autosuggestion.enable = true;
          syntaxHighlighting.enable = true;
        };
      };
    };
}
