{ self, lib, ... }: {
  options.globalvars = {
    configsrc = lib.mkOption {
      type = lib.types.path;
      default = self.outPath;
    };
    username = lib.mkOption {
      type = lib.types.str;
      default = "patin";
    };
    fullname = lib.mkOption {
      type = lib.types.str;
      default = "Patin Muangjan";
    };
  };
}
