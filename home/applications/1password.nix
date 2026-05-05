{
  flake.nixosModules._1password = { lib, config, pkgs, ... }: {
    programs = {
      _1password.enable = true;
      _1password-gui = {
        enable = true;
        polkitPolicyOwners = [ "${config.vars.username}" ];
      };
    };
    home-manager.users.${config.vars.username} = { config, ... }: {
      programs = {
        git = {
          settings = {
            gpg = {
              format = "ssh";
            };
            "gpg \"ssh\"" = {
              program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
            };
            commit = {
              gpgsign = true;
            };

            user = {
              signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN0b6TBKNTqUe/qWC85XulGqi9V/HdAjB2p1PcRGeeds";
            };
          };
        };
        ssh = let
          onePassPath = if pkgs.stdenv.isDarwin
            then "${config.home.homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
            else "${config.home.homeDirectory}/.1password/agent.sock";
        in {
          extraConfig = ''
            # If there is no forwarded agent (SSH_AUTH_SOCK empty), use 1Password agent
            Match exec "test -z \"$SSH_AUTH_SOCK\""
              IdentityAgent "${onePassPath}"
          '';
        };
      };
    };
  };
}
