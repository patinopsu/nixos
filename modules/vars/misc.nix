{ self, flake, inputs, ... }: {
  flake = {
    nixosModules.base = { lib, ... }:  {
      options.vars = {
        configsrc = lib.mkOption {
          type = lib.types.path;
          default = self.outPath;
        };
      };
    };
  };
}
