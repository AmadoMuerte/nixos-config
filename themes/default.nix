{ config, lib, pkgs, ... }:

let
  themeDirectories = lib.filterAttrs (_: type: type == "directory") (builtins.readDir ./.);
  themes = lib.mapAttrs (name: _: import (./. + "/${name}") { inherit lib pkgs; }) themeDirectories;
  selected = themes.${config.desktop.theme};
  user = config.desktop.themeUser;
  ghosttyReload = pkgs.writeShellScriptBin "ghostty-reload" ''
    exec ${pkgs.hyprland}/bin/hyprctl dispatch \
      'hl.dsp.send_shortcut({ mods = "CTRL SHIFT", key = "comma" })'
  '';
  # Telegram draws its own theme; keep the desktop-wide Qt/GTK theme out of it.
  telegramUnthemed = pkgs.symlinkJoin {
    name = "telegram-desktop-unthemed-${pkgs.telegram-desktop.version}";
    paths = [ pkgs.telegram-desktop ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram "$out/bin/Telegram" \
        --unset QT_QPA_PLATFORMTHEME \
        --set QT_STYLE_OVERRIDE Fusion \
        --unset GTK_THEME

      telegram_desktop="$out/share/applications/org.telegram.desktop.desktop"
      cp --remove-destination \
        "${pkgs.telegram-desktop}/share/applications/org.telegram.desktop.desktop" \
        "$telegram_desktop"
      substituteInPlace "$telegram_desktop" \
        --replace-fail "TryExec=Telegram" "TryExec=$out/bin/Telegram" \
        --replace-fail "Exec=Telegram -- %U" "Exec=$out/bin/Telegram -- %U" \
        --replace-fail "Exec=Telegram -quit" "Exec=$out/bin/Telegram -quit"

      telegram_service="$out/share/dbus-1/services/org.telegram.desktop.service"
      cp --remove-destination \
        "${pkgs.telegram-desktop}/share/dbus-1/services/org.telegram.desktop.service" \
        "$telegram_service"
      substituteInPlace "$telegram_service" \
        --replace-fail "${pkgs.telegram-desktop}/bin/Telegram" "$out/bin/Telegram"
    '';
  };
  homeFiles = lib.mapAttrs' (relative: contents:
    lib.nameValuePair ".config/${relative}" {
      text = contents;
      force = true;
    }
  ) selected.files;
in
{
  options.desktop = {
    theme = lib.mkOption {
      type = lib.types.enum (builtins.attrNames themes);
      default = "openbsd-dark";
      description = "Complete desktop theme to install.";
    };

    themeUser = lib.mkOption {
      type = lib.types.str;
      default = "amado";
      description = "User whose desktop configuration receives the selected theme.";
    };
  };

  config = {
    assertions = [{
      assertion = builtins.hasAttr user config.users.users;
      message = "desktop.themeUser '${user}' is not a configured NixOS user";
    }];

    home-manager.users.${user} = {
      home = {
        file = homeFiles // {
          ".local/bin/ghostty-reload".source = "${ghosttyReload}/bin/ghostty-reload";
          ".local/bin/Telegram".source = "${telegramUnthemed}/bin/Telegram";
          ".local/share/applications/org.telegram.desktop.desktop".source =
            "${telegramUnthemed}/share/applications/org.telegram.desktop.desktop";
          ".local/share/dbus-1/services/org.telegram.desktop.service".source =
            "${telegramUnthemed}/share/dbus-1/services/org.telegram.desktop.service";
        };
        packages = selected.fonts ++ [ ghosttyReload telegramUnthemed ];
        sessionVariables = selected.sessionVariables;
      };
      fonts.fontconfig.enable = true;
    };
  };
}
