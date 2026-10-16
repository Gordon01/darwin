This repository contains the Nix configuration for Alexander Sergeev's MacBook.

# Nix workflow

1. Run `nix flake check` before starting work and again after making changes. If needed, run additional validation for the Darwin or Home Manager configuration as well.
2. Stage any new Nix files before running Nix commands. Nix only works with tracked files.
3. Write Nix files as flake-parts modules.
4. For live Home Manager tests, check `home-manager generations` first. Apply
   the change and verify it works. Then run `home-manager switch --rollback`
   and remove temporary config edits.

# General guidance

Use Nix to obtain missing tools. Prefer `jq` and `ripgrep` when useful.

# References

- flake-parts: https://flake.parts/options/flake-parts.html
