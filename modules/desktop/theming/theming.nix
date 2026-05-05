{ inputs, self, ... }: {
  flake.nixosModules.desktop = { lib, config, pkgs, ... }: {
    imports = [
      self.inputs.stylix.nixosModules.stylix
    ];
    stylix = {
      enable = true;
      autoEnable = true;
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
      fonts = {
        serif = {
          name = "Noto Serif";
          package = pkgs.noto-fonts;
        };
        sansSerif = {
          name = "Inter Display";
          package = pkgs.inter;
        };
        monospace = {
          name = "JetBrainsMono Nerd Font";
          package = pkgs.nerd-fonts.jetbrains-mono;
        };
        emoji = {
          name = "Noto Color Emoji";
          package = pkgs.noto-fonts;
        };
        sizes = {
          desktop = 11;
          applications = 11;
        };
      };
      opacity = {
        desktop = 0.80;
        terminal = 0.80;
        applications = 0.80;
      };
      icons = {
        enable = true;
        light = "Papirus-Light";
        dark = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      cursor = {
        name = "WhiteSur-cursors";
        package = pkgs.whitesur-cursors;
        size = 24;
      };
    };
  };
}
