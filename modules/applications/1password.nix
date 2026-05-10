{ self, inputs, ... }: {
  flake.nixosModules._1password = { lib, config, pkgs, ... }: {
    programs = {
      _1password.enable = true;
      _1password-gui = {
        enable = true;
        polkitPolicyOwners = [ "${config.vars.username}" ];
      };
    };
    home-manager.users.${config.vars.username} = {
      imports = [
        self.homeModules._1password
      ];
    };
  };
}
