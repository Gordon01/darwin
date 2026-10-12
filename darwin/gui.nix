{ ... }: {
  flake.modules.darwin.gui = { ... }: {
    system.primaryUser = "alex";

    system.defaults.finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = false;
      ShowPathbar = true;
      ShowStatusBar = true;
    };

    system.defaults.screencapture.location = "/Users/alex/Pictures/Screenshots";
  };
}
