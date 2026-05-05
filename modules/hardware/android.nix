{ self, inputs, ... }: {
  flake.nixosModules.android = { pkgs, config, ... }: {
    users.users.${config.vars.username}.extraGroups = [ "adbusers" ];
    environment.systemPackages = [
      pkgs.android-tools
    ];
  };
}
