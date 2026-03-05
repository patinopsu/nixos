{ pkgs, config, ... }:

{
  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/seti.yaml";
    fonts = {
      serif = {
        name = "Noto Serif";
      };
      sansSerif = {
        name = "Noto Sans";
      };
      monospace = {
        name = "CaskaydiaCove Nerd Font Mono";
        package = pkgs.nerd-fonts.caskaydia-mono;
      };
      emoji = {
        name = "Noto Color Emoji";
      };
      sizes = {
        desktop = 11;
        applications = 11;
      };
    };
    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };
    cursor = {
      name = "WhiteSur-cursors";
      package = pkgs.whitesur-cursors;
      size = 24;
    };
  };
}
