{
  flake.homeModules.browsers = { lib, config, pkgs, osConfig, ... }: {
    programs = {
      firefox = {
        enable = true;
        policies = {
          DisableTelemetry = true;
        };
        nativeMessagingHosts = lib.mkIf (osConfig.services.desktopManager ? plasma6) [
          pkgs.kdePackages.plasma-browser-integration
        ];
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
