{ self, lib, ... }: 

{
  options.vars = {
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