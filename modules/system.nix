# Host-level settings: hostname and the Nix daemon itself.

{ config, lib, pkgs, ... }:

{
  # Define your hostname.
  networking.hostName = "nixos";

  # Modern Nix CLI (nix run/build/develop, flakes).
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Reclaim store space every week. Keeping this age-based makes recent
  # rollback points available while old system generations are collected.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
    persistent = true;
  };
}
