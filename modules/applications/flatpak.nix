{ inputs, ... }:{
  flake.nixosModules.flatpak = {
    imports = with inputs; [
      nix-flatpak.nixosModules.nix-flatpak
    ];
    services.flatpak = {
      enable = true;
      remotes = [
        {
          name = "flathub";
          location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        }
      ];
      packages = [
        "io.github.kolunmi.Bazaar"
        "com.github.tchx84.Flatseal"
      ];
      update.auto = {
        enable = true;
        onCalendar = "daily";
      };
    };
  };
}
