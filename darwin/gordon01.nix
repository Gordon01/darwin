{ self, inputs, ... }:
let
  configuration = { pkgs, ... }: {
    imports = [
      inputs.home-manager.darwinModules.home-manager
    ];

    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages = with pkgs; [
      vim
      tmux
      git
    ];

    # Necessary for using flakes on this system.
    # nix.settings.experimental-features = "nix-command flakes";
    nix.enable = false;

    # Enable alternative shell support in nix-darwin.
    # programs.fish.enable = true;

    # Set Git commit hash for darwin-version.
    system.configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 6;

    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";

    home-manager.users.alex = self.homeModules.gordon01;

    users.users.alex = {
      name = "alex";
      home = /Users/alex;
    };
  };
in
{
  flake.darwinConfigurations."Gordon01-MB" = inputs.nix-darwin.lib.darwinSystem {
    modules = [ configuration ];
  };
}
