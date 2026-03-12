{ config, lib, pkgs, inputs, ... }:

{
  users.users.${config.vars.username} = {
    isNormalUser = true;
    description = "Patin Muangjan";
    extraGroups = [ "wheel" "i2c" "input" "uinput" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };
  home-manager = {
    extraSpecialArgs = {
      inherit (inputs) self;
      inherit inputs;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.${config.vars.username} = {
      imports = [
        ./home/default.nix
      ];
    };
  };
}
