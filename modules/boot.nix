# Bootloader — systemd-boot for UEFI.

{ config, lib, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  virtualisation.docker.enable = true;

  networking.firewall = {
    checkReversePath = "loose";
    trustedInterfaces = [ "docker0" ];
  };

  fileSystems."/games" = {
    device = "/dev/disk/by-uuid/a6bbc6c4-dca9-44d4-860d-90b5cd94582e";
    fsType = "ext4";
    options = [
      "rw"
      "nofail"   
      "auto"      
    ];
  };
}
