{ self, lib, ... }: {
  options.globalvars = {
    # Disk UUID
    efiuuid = lib.mkOption {
      type = lib.types.str;
      default = "000";
    };
    bootuuid = lib.mkOption {
      type = lib.types.str;
      default = "000";
    };
    rootuuid = lib.mkOption {
      type = lib.types.str;
      default = "000";
    };

    # User Configuration
    username = lib.mkOption {
      type = lib.types.str;
      default = "patin";
    };
    fullname = lib.mkOption {
      type = lib.types.str;
      default = "Patin Muangjan";
    };

    # Misc
    configsrc = lib.mkOption {
      type = lib.types.path;
      default = self.outPath;
    };
  };
}
