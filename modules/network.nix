# Networking: NetworkManager.

{ config, lib, pkgs, ... }:
{
  networking.networkmanager.enable = true;
  networking.firewall.trustedInterfaces = [ "throne-tun" ];
  networking.firewall.checkReversePath = "loose";
  networking.localCommands = ''
    ip rule del pref 100 2>/dev/null || true
    ip rule del pref 101 2>/dev/null || true
    ip rule add pref 100 from 172.16.0.0/12 lookup main
    ip rule add pref 101 to 172.16.0.0/12 lookup main
  '';
}
