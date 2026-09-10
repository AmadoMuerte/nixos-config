# NixOS configuration

Personal NixOS system configuration. This repository mirrors `/etc/nixos` and
contains the boot, hardware, desktop, drivers, networking, packages, locale,
security, shell, theming, and user modules needed to rebuild the system.

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

No credentials, VPN profiles, SSH keys, application data, or user dotfiles are
stored here.
