# Zen Browser.
#
# Not packaged in nixpkgs yet, so we pull it from a community flake.
# Remove this module (and the line in default.nix) to go back to Firefox.

{ config, lib, pkgs, ... }:

let
  zen-browser-flake = builtins.getFlake "github:youwen5/zen-browser-flake";
in
{
  environment.systemPackages = [
    zen-browser-flake.packages.${pkgs.system}.zen-browser
  ];
}