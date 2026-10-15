{ inputs, ... }:
{
  perSystem =
    { system, ... }:
    {
      packages.fast-sync = inputs.fast-sync.packages.${system}.fast-sync;
    };
}
