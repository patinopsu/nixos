{ pkgs, lib, config, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.swtpm.enable = true;
    };
    docker.enable = true;
    virtualbox.host.enable = true;
    spiceUSBRedirection.enable = true;
  };
  programs = {
    virt-manager.enable = true;
  };
}
