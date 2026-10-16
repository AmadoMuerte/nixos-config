{ lib, pkgs }:

let
  colors = import ./colors.nix;
  files = lib.foldl' (files: application: files // application) { } [
    (import ./hyprland.nix { inherit colors; })
    (import ./waybar.nix { inherit colors; })
    (import ./ghostty.nix { inherit colors; })
    (import ./fuzzel.nix { inherit colors; })
    (import ./swaync.nix { inherit colors; })
    (import ./gtk.nix { inherit colors; })
    (import ./qt.nix { inherit colors; })
    (import ./hyprlock.nix { inherit colors; })
    (import ./fish.nix { inherit colors; })
  ];
in
{
  inherit files;
  fonts = [ pkgs.terminus_font pkgs.dejavu_fonts ];
  sessionVariables = {
    GTK_THEME = "adw-gtk3-dark";
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "24";
  };
}
