{ inputs, self, ... }: {
  flake.nixosModules.wmniri = { config, lib, pkgs, ... }: {
    imports = [
      self.nixosModules._1password
      self.nixosModules.uwsm
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
        self.homeModules.spotify
        self.homeModules.editors
      ];
    };
    services = {
      udisks2.enable = true;
      gvfs.enable = true;
      blueman = lib.mkIf (config.hardware ? bluetooth) {
        enable = true;
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
    };
    environment = {
      systemPackages = with pkgs; [
        nirius
        nautilus
        loupe
      ];
    };
  };
}
