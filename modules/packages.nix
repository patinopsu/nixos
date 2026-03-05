{ config, lib, pkgs, ... }:

{
  programs = {
    gpu-screen-recorder.enable = true;
    _1password.enable = true;
    _1password-gui.enable = true;
    _1password-gui.polkitPolicyOwners = [ "patin" ];
  };
  environment.systemPackages = with pkgs; [
    swtpm
    mesa-demos
    vulkan-tools
    distrobox
    android-tools
    libva-utils
    gparted
  ];
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libxcrypt-legacy
    zlib
    gtk3
    pango
    harfbuzz
    atk
    cairo
    gdk-pixbuf
    glib
  ];
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.caskaydia-cove
    ];
  };
}