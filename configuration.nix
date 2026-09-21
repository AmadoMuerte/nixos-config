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

{
  imports = [
    ./hardware-configuration.nix
    ./modules/default.nix
  ];

  # This option defines the first version of NixOS installed on this machine.
  # Used to keep compatibility with app data from older installations.
  # Do NOT change it unless you know exactly what you are doing.
  system.stateVersion = "26.05";
}