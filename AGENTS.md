This is a Nix repository for Alexander Sergeev's MacBook.

# Nix

1. Run `nix flake check` before investigating the codebase and again after making changes.
2. Stage any new Nix files before running Nix commands. Nix only works with files tracked by git.
3. Every Nix file should be a flake-parts module.

# References

flake-parts: https://flake.parts/options/flake-parts.html
