{ config, lib, pkgs, ... }:

{
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.plasma-login-manager.enable = true;
  };
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    khelpcenter
    kde-gtk-config
    plasma-systemmonitor
  ];
  environment.systemPackages = (with pkgs.kdePackages; [
    qtmultimedia
  ]) ++ ( with pkgs; [
    klassy
    plasma-panel-colorizer
  ]);
}
