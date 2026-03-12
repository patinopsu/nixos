{inputs, pkgs, lib, ...}:

{
  services.udisks2.enable = true;
  services.displayManager.ly = {
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
  systemd.services.display-manager.environment.XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE";
  programs.hyprland = {
    enable = true;
    withUWSM  = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };
  environment.systemPackages = with pkgs.kdePackages; ([
    kio
    kio-fuse
    kio-extras
    dolphin
  ] ++ (with pkgs; [
    imv
    haruna
    digikam
  ]));
  environment.etc = {
    "/xdg/menus/applications.menu".text = builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
  };
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
  };
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        kdePackages.xdg-desktop-portal-kde
      ];
      config = {
        common = {
          default = [
            "gtk"
          ];
        };
        hyprland = lib.mkForce {
          default = [
            "kde"
            "hyprland"
          ];
          "org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ];
          "org.freedesktop.impl.portal.Screenshot" = [ "hyprland" ];
        };
      };
    };
  };
}
