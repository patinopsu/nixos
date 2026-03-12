{ self, lib, ... }: 

{
  options.vars = {
    configsrc = lib.mkOption {
      type = lib.types.path;
      default = self.outPath;
    };
    machinetype = lib.mkOption {
      type = lib.types.path;
      default = "os";
    };
  };
}