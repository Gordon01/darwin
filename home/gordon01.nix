{ inputs, self, ... }:
{
  flake.homeConfigurations.gordon01 = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.aarch64-darwin;
    modules = [ self.homeModules.gordon01 ];
  };

  flake.homeModules = {
    common = { ... }: {
      home.stateVersion = "26.11";
    };

    gordon01 = { lib, pkgs, ... }: {
      imports = [
        self.homeModules.common
        self.homeModules.dev
      ];

      home.username = lib.mkDefault "alex";
      home.homeDirectory = lib.mkDefault "/Users/alex";
      programs.ghostty = {
        enable = true;
        package = pkgs.ghostty-bin;
        enableZshIntegration = true;
      };
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
