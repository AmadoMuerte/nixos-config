# Desktop stack: display manager, compositor, bluetooth and polkit agent.

{ config, lib, pkgs, ... }:

{
  # GNOME display manager (session picker / greeter).
  services.displayManager.gdm.enable = true;

  # Hyprland compositor.
  programs.hyprland.enable = true;

  # Throne VPN (tun mode).
  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };

  programs.noisetorch.enable = true;

  # Bluetooth.
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  systemd.user.services.pipewire-pulse.environment.LADSPA_PATH =
  "${pkgs.rnnoise-plugin}/lib/ladspa";

  # LXQt PolicyKit agent — lets GUI apps ask for elevated privileges.
  systemd.user.services.lxpolkit = {
    description = "LXQt PolicyKit Agent";
    # GDM starts Hyprland directly on this machine, so graphical-session.target
    # is never activated. default.target is active for every user login and has
    # the Wayland display environment imported by GDM.
    wantedBy = [ "default.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.lxqt.lxqt-policykit}/bin/lxqt-policykit-agent";
      Restart = "on-failure";
      RestartSec = 3;
    };
  };
}
