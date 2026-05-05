{
  flake.homeModules.git = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Patin Muangjan";
          email = "patin@patin.dev";
        };
        safe = {
          directory = "/etc/cfg/";
        };
      };
    };
  };
}
