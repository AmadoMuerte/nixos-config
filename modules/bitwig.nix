{ pkgs, ... }:

let
  bitwigBeta = pkgs.buildFHSEnv {
    name = "bitwig-beta";

    targetPkgs = pkgs: with pkgs; [
      # GTK / UI
      gtk3
      glib
      cairo
      gdk-pixbuf
      freetype
      fontconfig

      # Audio
      alsa-lib
      pipewire
      pulseaudio
      libjack2

      # Graphics
      libglvnd
      mesa
      vulkan-loader
      wayland
      libxkbcommon

      # X11
      libx11
      libxcb
      libxcursor
      libxtst
      libxcb-util
      libxcb-wm

      # Runtime
      libjpeg
      zlib
      stdenv.cc.cc.lib

      # Utilities
      ffmpeg
      xdg-utils

      # Desktop
      gsettings-desktop-schemas
      adwaita-icon-theme
    ];

    runScript =
      "/home/amado/.local/opt/bitwig-studio/opt/bitwig-studio/bitwig-studio";

    extraInstallCommands = ''
      mkdir -p $out/share/applications

      cat > $out/share/applications/bitwig-beta.desktop <<EOF
      [Desktop Entry]
      Type=Application
      Version=1.0
      Name=Bitwig Studio 6 Beta
      Comment=Digital Audio Workstation
      Exec=bitwig-beta %F
      Icon=audio-x-generic
      Terminal=false
      Categories=AudioVideo;Audio;AudioVideoEditing;
      StartupNotify=true
      StartupWMClass=Bitwig Studio
      Keywords=DAW;Music;Audio;MIDI;Bitwig;
      EOF
    '';

    meta = {
      description = "Bitwig Studio 6 Beta";
      mainProgram = "bitwig-beta";
    };
  };
in
{
  environment.systemPackages = [
    bitwigBeta
  ];
}
