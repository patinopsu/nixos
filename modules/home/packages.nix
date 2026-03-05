{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    s-tui
    lazygit
    ddcutil
    btop
    kitty
    scrcpy
    wl-clipboard
    zoxide
    eza
    fzf
    lolcat
    nvtopPackages.full
    figlet
    usbutils
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    rar
    sops
    age
    libnatpmp
    pciutils
    tldr
  ];
}
