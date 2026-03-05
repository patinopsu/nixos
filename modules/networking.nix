{ config, lib, pkgs, ... }:

{
  networking = {
    wireless.enable = true;
    networkmanager = {
      enable = true;
      dhcp = "internal";
      dns = "systemd-resolved";
      wifi = {
        backend = "wpa_supplicant";
        macAddress = "stable-ssid";
      };
    };
    firewall = {
      enable = true;
      backend = "firewalld";
    };
  };
  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    resolved = {
      enable = true;
      settings.Resolve = {
        DNSSEC = true;
      };
    };
  };
}
