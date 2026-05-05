{
  flake.nixosModules.t14gen1lte = { config, pkgs, ... }: let
    xmm7360_usb = config.boot.kernelPackages.callPackage ({ stdenv, fetchFromGitHub, kernel, kmod }:
      stdenv.mkDerivation {
        pname = "xmm7360-usb";
        version = "compat-5.8-${kernel.version}";

        src = fetchFromGitHub {
          owner = "Ecos-hj";
          repo = "xmm7360_usb";
          rev = "compat-5.8";
          sha256 = "sha256-IaMTzruxGFyZjFCW4vAjULHwyBRRZ2pBph4WTDuhYc4=";
        };

        nativeBuildInputs = [ kmod ];
        buildInputs = [ kernel.dev ];

        buildPhase = ''
           make -C ${kernel.dev}/lib/modules/${kernel.modDirVersion}/build M=$(pwd) modules
        '';
        makeFlags = [
          "KERNEL_DIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
        ];

        installPhase = ''
          mkdir -p $out/lib/modules/${kernel.modDirVersion}/extra
          cp *.ko $out/lib/modules/${kernel.modDirVersion}/extra/
        '';
      }) {};
  in {
    boot.kernelModules = [ "xmm7360_usb" ];
    boot.initrd.kernelModules = [ "xmm7360_usb" ];
    boot.extraModulePackages = [ xmm7360_usb ];
    networking = {
      networkmanager.ensureProfiles.profiles = {
        "trueh" = {
          connection = {
            id = "TRUE-H";
            type = "gsm";
            autoconnect = true;
          };
          gsm = {
            apn = "internet";
          };
        };
      };
    };
    #services.udev.extraRules = ''
    #  SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="be:06:37:34:23:d5", NAME="wwan0", OPTIONS="link_priority=100"
    #'';
    networking.firewall.allowedUDPPorts = [
      67
      68
      53
    ];
    environment.systemPackages = with pkgs; [
      kdePackages.spacebar
    ];
  };
}
