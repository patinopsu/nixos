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
        desktop = 10;
        applications = 11;
      };
    };
    icons = {
      enable = true;
      package = pkgs.kdePackages.breeze-icons;
      dark = "breeze-dark";
      light = "breeze";
    };
    cursor = {
      name = "WhiteSur-cursors";
      package = pkgs.whitesur-cursors;
      size = 24;
    };
  };
}
