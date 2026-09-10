# Host-level settings: hostname and the Nix daemon itself.

{ config, lib, pkgs, ... }:

{
  # Define your hostname.
  networking.hostName = "nixos";

  # Modern Nix CLI (nix run/build/develop, flakes).
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
