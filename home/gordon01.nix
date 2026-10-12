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

    gordon01 = { lib, ... }: {
      imports = [
        self.homeModules.common
        self.homeModules.dev
        self.homeModules.shell
      ];

      home.username = lib.mkDefault "alex";
      home.homeDirectory = lib.mkDefault "/Users/alex";
    };

    dev = { pkgs, ... }: {
      home.packages = with pkgs; [
        nixd
        nixfmt
      ];

      programs = {
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
      };
    };
  };
}
