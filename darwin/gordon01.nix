{ self, inputs, ... }:
{
  flake.darwinConfigurations."Gordon01-MB" = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      ({ pkgs, ... }: {
        imports = [ inputs.home-manager.darwinModules.home-manager ];

        # Available to all users on this Mac.
        environment.systemPackages = with pkgs; [
          vim
          tmux
          git
        ];

        # Nix is managed outside nix-darwin by Determinate Nix installer.
        nix.enable = false;

        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Keep this unchanged unless intentionally migrating nix-darwin state.
        system.stateVersion = 6;

        nixpkgs.hostPlatform = "aarch64-darwin";

        home-manager.users.alex = self.homeModules.gordon01;

        users.users.alex.home = "/Users/alex";
      })
    ];
  };
}
