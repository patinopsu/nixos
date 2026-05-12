{ self, flake, inputs, ... }: {
  flake = {
    nixosModules.base = { lib, ... }:  {
      options.vars = {
        prettyname = lib.mkOption {
          type = lib.types.str;
          default = "undefined";
        };
        codename = lib.mkOption {
          type = lib.types.str;
          default = "undefined";
        };
        nextdns_hostname = lib.mkOption {
          type = lib.types.str;
          default = "undefined";
        };
        configsrc = lib.mkOption {
          type = lib.types.path;
          default = self.outPath;
        };
      };
    };
  };
}
