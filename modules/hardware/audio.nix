{
  flake.nixosModules.audio = { config, lib, pkgs, ... }: {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };
    environment.systemPackages = with pkgs; [
      pwvucontrol
    ];
  };
}
