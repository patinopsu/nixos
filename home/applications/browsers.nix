{
  flake.homeModules.browsers = { config, pkgs, ... }: {
    programs = {
      firefox = {
        enable = true;
        policies = {
          DisableTelemetry = true;
        };
        profiles.main = {
          name = "Main Profiles";
        };
      };
      brave = {
        enable = true;
      };
    };
    stylix = {
      targets = {
        firefox = {
          firefoxGnomeTheme.enable = true;
          profileNames = [
            "main"
          ];
        };
      };
    };
  };
}
