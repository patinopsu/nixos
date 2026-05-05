{
  flake.homeModules.git = {
    programs.git = {
      enable = true;
      settings = {
        safe = {
          directory = "/etc/cfg/";
        };
      };
    };
  };
}
