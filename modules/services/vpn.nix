{
  flake.nixosModules.vpn = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      wireguard-tools
    ];
  };
}
