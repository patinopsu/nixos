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
          fonts.override = {
            sizes = {
              applications = 15;
            };
          };
          profileNames = [
            "main"
          ];
        };
      };
    };
  };
}
