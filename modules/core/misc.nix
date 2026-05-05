{
  flake.nixosModules.base = { config, lib, pkgs, ... }: {
    time.timeZone = "Asia/Bangkok";
    system.stateVersion = "25.11";
    programs.zsh.enable = true;
    environment.systemPackages = with pkgs; [
      usbutils
      pciutils
      minicom
    ];
    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocales = ["th_TH.UTF-8/UTF-8"];
      extraLocaleSettings = {
        LC_MESSAGES = "en_US.UTF-8";
        LC_CTYPE = "en_US.UTF8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
        LC_ADDRESS = "th_TH.UTF-8";
        LC_MEASUREMENT = "th_TH.UTF-8";
        LC_MONETARY = "th_TH.UTF-8";
        LC_NAME = "th_TH.UTF-8";
        LC_PAPER = "th_TH.UTF-8";
        LC_TELEPHONE = "th_TH.UTF-8";
        LC_COLLATE = "th_TH.UTF-8";
      };
    };
  };
}
