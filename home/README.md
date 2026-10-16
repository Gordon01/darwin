## Home Manager

Apply the standalone Home Manager configuration without requiring `sudo`:

```sh
NIXPKGS_ALLOW_UNFREE=1 home-manager switch --flake .#gordon01 --impure
```
