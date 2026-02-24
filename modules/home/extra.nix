{ config, lib, pkgs, ... }:

{
  home.file.".p10k.zsh" = {
    source = ../../src/p10k.zsh;
  };
  home.sessionVariables = {
    ZSH_CACHE_DIR = "$HOME/.cache/zsh";
  };
}