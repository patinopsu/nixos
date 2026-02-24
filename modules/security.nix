{ lib, pkgs, ... }:

{
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo = {
      extraConfig = ''
        Defaults pwfeedback
        Defaults passprompt="🔒password for %p: "
        Defaults badpass_message="❌Incorrect Password. Please try again."
      '';
    };
  };
}
