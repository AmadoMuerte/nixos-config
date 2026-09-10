# Localization: timezone, language and keyboard layout.

{ config, lib, pkgs, ... }:

{
  # Time zone.
  time.timeZone = "Europe/Moscow";

  # System language.
  i18n.defaultLocale = "en_US.UTF-8";

  # Locale overrides for Russian-format dates/numbers while keeping the system
  # locale in English.
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # X11 keymap (used by Hyprland as well).
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}