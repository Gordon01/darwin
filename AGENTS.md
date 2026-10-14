This is a Nix repository for Alexander Sergeev's MacBook.

# Nix

1. Run `nix flake check` before investigating the codebase and again after making changes. If appropriate, also run additional validation such as building the NixOS, Darwin, or Home Manager configurations.
2. Stage any new Nix files before running Nix commands. Nix only works with tracked files.
3. Write Nix files as flake-parts modules.
4. For live Home Manager tests, check `home-manager generations` first. Apply
   the change and verify it works. Then run `home-manager switch --rollback`
   and remove temporary config edits.

# General

Use Nix to obtain missing tools. Prefer `jq` and `ripgrep` when useful.

# References

flake-parts: https://flake.parts/options/flake-parts.html
