{ inputs, self, ... }:
{
  flake.homeConfigurations.gordon01 = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.aarch64-darwin;
    modules = [
      self.homeModules.common
      self.homeModules.dev
    ];
  };

  flake.homeModules = {
    common = { ... }: {
      home.stateVersion = "26.11";
      # home.username = "alex";
      # home.homeDirectory = /Users/alex;
    };

    dev = { pkgs, ... }: {
      home.packages = with pkgs; [
        nixd
        nixfmt
      ];

      programs = {
        starship = {
          enable = true;
          enableZshIntegration = true;
        };
        direnv = {
          enable = true;
          enableZshIntegration = true;
        };
        git.enable = true;
        git.settings.user = {
          name = "Alexander Sergeev";
          email = "etc9053@gmail.com";
        };
        tmux = {
          enable = true;
          mouse = true;
          newSession = true;
          secureSocket = true;
        };
        zsh = {
          enable = true;
          enableCompletion = true;
          autosuggestion.enable = true;
          syntaxHighlighting.enable = true;
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
  };
}
