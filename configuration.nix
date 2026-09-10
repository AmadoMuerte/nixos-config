# NixOS configuration — entry point.
#
# This file only wires together modules. All actual settings live in
# ./modules/*.nix, each dedicated to one concern.
#
#   modules/
#   ├── default.nix    # module aggregator (import list)
#   ├── boot.nix       # systemd-boot
#   ├── system.nix     # hostname, nix settings
#   ├── locale.nix     # timezone, i18n, keyboard layout
#   ├── users.nix      # user accounts
#   ├── network.nix    # NetworkManager
#   ├── security.nix   # unfree packages policy
#   ├── packages.nix   # installed packages (grouped by use)
#   ├── desktop.nix    # display manager, Hyprland, bluetooth, polkit
#   ├── theming.nix    # fonts, cursors, GTK/Qt environment, dconf
#   └── shell.nix      # fish shell

{ config, pkgs, ... }:

let
  homeManager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/fd0956c99c41ae3c13a73a638f1f7e963aebc4ab.tar.gz";
    sha256 = "0fyjh6bv6p72ynz0pjkzlf1966h2dq40ivwbzy73lk45aqam1ymh";
  };
in
{
  imports = [
    ./hardware-configuration.nix
    ./modules/default.nix
    "${homeManager}/nixos"
    ./themes
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.amado = import ./home.nix;
  };

  # Complete desktop theme installed through Home Manager.
  desktop.theme = "openbsd-dark";

  # This option defines the first version of NixOS installed on this machine.
  # Used to keep compatibility with app data from older installations.
  # Do NOT change it unless you know exactly what you are doing.
  system.stateVersion = "26.05";
}
