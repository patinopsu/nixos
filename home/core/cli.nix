{ self, inputs, ... }:{
  flake.homeModules.cli = { osConfig, config, pkgs, ... }: {
    imports = [
      inputs.nix-index-database.homeModules.default
    ];
    programs.nix-index-database.comma.enable = true;
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
          source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
          echo Welcome, ${osConfig.vars.fullname}, I hope you bring some buritos 🌯
          echo ""
          fastfetch -c ${osConfig.vars.configsrc}/assets/fastfetch.jsonc -l ${osConfig.vars.configsrc}/src/nix-snowflakes.png
          [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
        '';
        shellAliases = {
          garbagecollect = "sudo nix-collect-garbage -d && nrb";
          cd = "z";
         "beaufetch" = "fastfetch -c ${osConfig.vars.configsrc}/src/fastfetch.jsonc -l ${osConfig.vars.configsrc}/src/nix-snowflakes.png";
        };
      };
    programs.atuin = {
      enable = true;
    };
    home = {
      packages = with pkgs; [
        zoxide
        eza
        fzf
        fastfetch
        lazygit
      ];
      file = {
        ".p10k.zsh" = {
          source = "${osConfig.vars.configsrc}/assets/p10k.zsh";
        };
      };
    };
  };
}
