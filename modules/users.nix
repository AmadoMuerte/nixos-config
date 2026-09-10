# User accounts.

{ config, lib, pkgs, ... }:

{
  users.users."amado" = {
    isNormalUser = true;
    description = "amado";
    # networkmanager group lets the user manage connections via nmcli/applets.
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    # Default shell.
    shell = pkgs.fish;
  };

 
}
