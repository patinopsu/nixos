{
  flake.nixosModules.waydroid = { pkgs, ... }: {
    virtualisation.waydroid = {
      enable = true;
      package = pkgs.waydroid-nftables;
    };
    networking.nftables.enable = true;
    environment.systemPackages = with pkgs; [
      wl-clipboard
    ];
  };
}
