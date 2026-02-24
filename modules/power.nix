{ pkgs, ...}:

{
  services = {
    upower = {
      enable = true;
    };
    tuned = {
      enable = true;
    };
    tlp = {
      enable = false;
    };
  };
}
