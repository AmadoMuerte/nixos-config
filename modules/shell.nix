# Fish shell: vendor completions from installed packages are enabled by
# default; per-user config lives in ~/.config/fish/.

{ config, lib, pkgs, ... }:

{
  programs.fish.enable = true;
}