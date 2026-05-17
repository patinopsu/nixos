{ inputs, ... }: {
  flake.nixosModules.opendeck = { lib, config, pkgs, ... }: {
    services.udev.extraRules = ''
      # Ajazz AKP153 Rev2 - USB and HIDRAW access
      SUBSYSTEM=="usb", ATTRS{idVendor}=="0300", ATTRS{idProduct}=="3010", GROUP="input", MODE="0660"
      KERNEL=="hidraw*", ATTRS{idVendor}=="0300", ATTRS{idProduct}=="3010", GROUP="input", MODE="0660"
      # uinput access
      KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
    '';
    services.flatpak.packages = [
      "me.amankhanna.opendeck"
    ];
    environment.systemPackages = with pkgs; [
      nodejs
      wineWow64Packages.waylandFull
    ];
  };
}
