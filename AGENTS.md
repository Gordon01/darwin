This is a Nix repository for Alexander Sergeev's MacBook.

# Nix

1. Run `nix flake check` before investigating the codebase and again after making changes. If appropriate, also run additional validation such as building the NixOS, Darwin, or Home Manager configurations.
2. Stage any new Nix files before running Nix commands. Nix only works with tracked files.
3. Every Nix file should be a flake-parts module.

# General

1. If a tool you need is unavailable, use Nix to obtain it.
2. Use `jq` and `ripgrep` when practical.

# References

flake-parts: https://flake.parts/options/flake-parts.html
