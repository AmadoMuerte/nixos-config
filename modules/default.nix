# Aggregates all feature modules. Add new modules to this list instead of
# touching configuration.nix.

{ ... }:

{
  imports = [
    ./boot.nix
    ./system.nix
    ./locale.nix
    ./users.nix
    ./network.nix
    ./security.nix
    ./packages.nix
    ./browser.nix
    ./desktop.nix
    ./theming.nix
    ./shell.nix
    ./drivers.nix
  ];
}
