{
  flake.nixosModules.base = { config, pkgs, ...  }: {
    security = {
      protectKernelImage = true;
      rtkit.enable = true;
      polkit.enable = true;
      sudo = {
        extraConfig = ''
          Defaults pwfeedback
          Defaults passprompt="🔒password for %p: "
          Defaults badpass_message="❌Incorrect Password. Please try again."
        '';
      };
      apparmor = {
        enable = true;
        killUnconfinedConfinables = true;
      };
    };
  };
}
