# Networking: NetworkManager.

{ config, lib, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.firewall.trustedInterfaces = [ "throne-tun" ];
  networking.firewall.checkReversePath = "loose";
}