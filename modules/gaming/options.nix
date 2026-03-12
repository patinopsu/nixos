{ self, lib, ... }: 

{
  options.vars.gaming = {
    ananicy-cpp.enable = lib.mkEnableOption "Enable Ananicy";
    steam.enable = lib.mkEnableOption "Enable Steam";
  };
}