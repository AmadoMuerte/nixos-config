# Networking: NetworkManager and Docker/VPN split routing.

{ config, lib, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.firewall.trustedInterfaces = [ "throne-tun" ];
  networking.firewall.checkReversePath = "loose";

  # Throne TUN mode installs policy routing (fwmark 0x2023 -> table 2022 ->
  # default dev throne-tun). With net.bridge.bridge-nf-call-iptables = 1,
  # Docker's forwarded frames hit Throne's mark rules too, so container
  # traffic is pulled into the VPN and containers stop reaching each other.
  #
  # Lower preference numbers are evaluated first, so these rules keep Docker's
  # address space in the normal routing table (i.e. off the VPN) even when a
  # packet carries Throne's fwmark. 172.16.0.0/12 covers every default Docker
  # bridge subnet (172.17.0.0/16 through 172.31.0.0/16).
  networking.localCommands = ''
    ip rule del pref 100 2>/dev/null || true
    ip rule del pref 101 2>/dev/null || true
    ip rule add pref 100 from 172.16.0.0/12 lookup main
    ip rule add pref 101 to 172.16.0.0/12 lookup main
  '';
}
