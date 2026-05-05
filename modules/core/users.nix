{
  flake.nixosModules.base = { config, lib, pkgs, ... }: {
    users = {
      users = {
        ${config.vars.username} = {
          description = "${config.vars.fullname}";
          extraGroups = [ "wheel" "networkmanager" ];
          initialHashedPassword = "$6$GH7KlyIHXH7kGWaR$lqIch6g4sIgxIV9J.pxtpAQwU/tY8KK/U1sO7847RVC1L4vcIV2jL6cOr8szh7T1QH908jCno1ylb3SQPNYcY0";
          isNormalUser = true;
          shell = pkgs.zsh;
        };
      };
    };
  };
}
