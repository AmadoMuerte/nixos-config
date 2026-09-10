# Security / package policy: allow unfree software globally.

{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
}