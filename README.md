# NixOS configuration

Personal NixOS system configuration. This repository mirrors `/etc/nixos` and
contains the boot, hardware, desktop, drivers, networking, packages, locale,
security, shell, user modules, and the OpenBSD Dark desktop theme needed to
rebuild the system.

## Install

From a fresh NixOS installation:

```sh
sudo mv /etc/nixos /etc/nixos.install-backup
sudo git clone https://github.com/AmadoMuerte/nixos-config /etc/nixos
sudo nixos-rebuild boot
reboot
```

`hardware-configuration.nix` contains this machine's filesystem UUIDs and AMD
hardware settings. On different hardware, keep the freshly generated
`/etc/nixos/hardware-configuration.nix` instead of the repository copy and
review `modules/drivers.nix` before rebuilding.

## Desktop theme

The Nix source for the theme lives in `themes/openbsd-dark/`. The selected
theme is set in `configuration.nix`:

```nix
desktop.theme = "openbsd-dark";
```

Home Manager installs its generated Hyprland, Hyprlock, Waybar, Ghostty,
Fuzzel, SwayNC, GTK, Qt, and Fish files into `/home/amado/.config`. Shared
colors are defined once in `themes/openbsd-dark/colors.nix`.

No credentials, VPN profiles, SSH keys, application data, or unrelated user
dotfiles are stored here.
