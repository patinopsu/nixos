{ inputs, self, ... }: {
  flake.nixosModules.plasmade = { config, lib, pkgs, ... }: {
    imports = [
      self.nixosModules._1password
    ];
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.plasma-login-manager.enable = true;
    };
    home-manager.users.${config.vars.username} = {
      imports = [
        self.homeModules.browsers
        self.homeModules.terminal
        self.homeModules.vicinae
        self.homeModules.spotify
        self.homeModules.editors
      ];
      stylix.targets.kde = {
        decorations = "org.kde.klassy";
      };
    };
    environment = {
      systemPackages = with pkgs; [
        klassy
      ];
    };
  };
}
