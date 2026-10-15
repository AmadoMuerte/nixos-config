{ lib, ... }:

{
  services.flatpak.enable = true;

  # Make Flatpak .desktop files visible to launchers such as fuzzel.
  environment.sessionVariables.XDG_DATA_DIRS = lib.mkBefore [
    "/var/lib/flatpak/exports/share"
    "$HOME/.local/share/flatpak/exports/share"
  ];
}
