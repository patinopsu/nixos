{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    oh-my-zsh = { 
      enable = true;
        plugins = [
          "git"
          "eza"
          "zoxide"
          "fzf"
        ];
      };
      initContent = ''
        echo Welcome, ${config.globalvars.fullname}, I hope you bring some buritos 🌯
        echo ""
        fastfetch -c ${config.globalvars.configsrc}/src/fastfetch.jsonc -l ${config.globalvars.configsrc}/src/nix-snowflakes.png
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      '';
      shellAliases = {
        garbagecollect = "sudo nix-collect-garbage -d && nrb";
        plasmafetch = "nix run github:nix-community/plasma-manager > ~/nixos/modules/home/plasma.nix";
        cd = "z";
        "beaufetch" = "fastfetch -c ${config.globalvars.configsrc}/src/fastfetch.jsonc -l ${config.globalvars.configsrc}/src/nix-snowflakes.png";
      };
    };
  programs.atuin = {
    enable = true;
  };
}