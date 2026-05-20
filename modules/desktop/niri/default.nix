{ inputs, self, ... }: {
  flake.nixosModules.niriwm = { config, lib, pkgs, ... }: {
    imports = [
      self.nixosModules._1password
    ];
    nixpkgs.overlays = [
      inputs.niri.overlays.niri
    ];
    home-manager.users.${config.vars.username} = {
      imports = [
        inputs.niri.homeModules.niri
        self.homeModules.int-niricfg
        self.homeModules.int-noctalia
        self.homeModules.browsers
        self.homeModules.terminal
        self.homeModules.vicinae
        self.homeModules.media
        self.homeModules.editors
      ];
    };
    services = {
      udisks2.enable = true;
      gvfs.enable = true;
      blueman = lib.mkIf (config.hardware ? bluetooth) {
        enable = true;
      };
      gnome = lib.mkForce {
        gnome-keyring.enable = true;
        gcr-ssh-agent.enable = false;
      };
      displayManager.ly = {
        enable = true;
        settings = {
          animation = "colormix";
          bigclock = "en";
          brightness_down_key = "";
          brightness_up_key = "";
          clock = "%c";
          edge_margin = "1";
        };
      };
    };
    programs = {
      niri = {
        enable = true;
        package = pkgs.niri-unstable;
      };
      uwsm = {
        enable = true;
        waylandCompositors = {
          niri = {
            prettyName = "Niri";
            comment = "Niri compositor managed by UWSM";
            binPath = "${pkgs.niri}/bin/niri-session";
          };
        };
      };
    };
    systemd = {
      services.display-manager.environment.XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE";
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "GMOME Authentication Agent";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
            Restart = "on-failure";
            RestartSec = 1;
            TimeoutStopSec = 10;
          };
      };
    };
    environment = {
      systemPackages = with pkgs; [
        nirius
        nautilus
        loupe
        xwayland-satellite
      ];
    };
  };
}
