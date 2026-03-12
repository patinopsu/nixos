{ self, lib, ... }: 

{
  options.vars = {
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
  };
}
