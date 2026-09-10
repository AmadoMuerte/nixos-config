{ config, lib, pkgs, ... }:

let
  themeDirectories = lib.filterAttrs (_: type: type == "directory") (builtins.readDir ./.);
  themes = lib.mapAttrs (name: _: import (./. + "/${name}") { inherit lib pkgs; }) themeDirectories;
  selected = themes.${config.desktop.theme};
  user = config.desktop.themeUser;
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
        file = homeFiles;
        packages = selected.fonts;
        sessionVariables = selected.sessionVariables;
      };
      fonts.fontconfig.enable = true;
    };
  };
}
