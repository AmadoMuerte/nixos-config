# System-wide theme: fonts, GTK/Qt environment and the dconf backend that
# makes `color-scheme` / `prefer-dark` actually work for libadwaita apps.

{ config, lib, pkgs, ... }:

{
  # Fonts.
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-color-emoji
    ];
  };

  # Environment variables shared by every session.
  environment.sessionVariables = {
    # Qt theming via qt6ct.
    QT_QPA_PLATFORMTHEME = "qt6ct";
    # Force the dark theme on every GTK app.
    GTK_THEME = "adw-gtk3-dark";
    # Normal cursor (instead of Hyprland's default).
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "24";
    # GLib looks for GSettings schemas in $XDG_DATA_DIRS/glib-2.0/schemas.
    # Since v50 gsettings-desktop-schemas ships them in the new
    # share/gsettings-schemas/<name>/glib-2.0/schemas layout, point GLib
    # there directly so `gsettings` and libadwaita apps can read them.
    GSETTINGS_SCHEMA_DIR =
      "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
  };

  # dconf — required for `gsettings` (libadwaita dark mode) to work.
  programs.dconf.enable = true;
}