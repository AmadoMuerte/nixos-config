# NixOS configuration

Personal NixOS system configuration — the single source of truth for this
machine: boot, hardware, desktop, drivers, networking, packages, locale,
security, shell, user modules, Home Manager, and both desktop themes.

## Build

The flake in this repository is the entry point:

```sh
sudo nixos-rebuild switch --flake ~/nixos-config#nixos   # apply
sudo nixos-rebuild build  --flake ~/nixos-config#nixos   # build only
```

The running configuration used to come from a duplicate tree at `~/.config/nix`.
That tree has been archived to `~/.config/nix-backup` and is no longer an entry
point — do not rebuild from it.

Home Manager is a flake input (pinned revision, `inputs.nixpkgs.follows =
"nixpkgs"` so there is exactly one nixpkgs), and its module sits in the
`nixosConfigurations.nixos` module list. `configuration.nix` does the wiring:
it imports `./hardware-configuration.nix`, `./modules/default.nix`, and
`./themes`; it enables Home Manager with `useGlobalPkgs` and `useUserPackages`
and `users.amado = import ./home.nix`; and it sets `desktop.theme`.

`hardware-configuration.nix` contains this machine's filesystem UUIDs and AMD
hardware settings. On different hardware, keep the freshly generated
`/etc/nixos/hardware-configuration.nix` instead of the repository copy and
review `modules/drivers.nix` before rebuilding.

## Desktop theme

Two themes are available: `openbsd-dark` and `breakcore`. Each lives in its own
directory under `themes/`.

Switch in one line in `configuration.nix`:

```nix
desktop.theme = "breakcore";   # or "openbsd-dark"
```

The loader default stays `openbsd-dark`. Layout: `themes/default.nix` holds the
option and the installer, and each `themes/<theme>/` holds 11 files —
`colors.nix`, a `default.nix` aggregator, and 9 app modules: hyprland, waybar,
ghostty, fuzzel, swaync, gtk, qt, hyprlock, fish. Home Manager installs the
generated files into `/home/amado/.config`.

**Trap:** the loader discovers themes with `builtins.readDir` on the
source-filtered store copy, so a theme directory must be tracked by git —
an untracked `themes/breakcore/` fails the build with ``error: A definition for
option 'desktop.theme' is not of type 'value "openbsd-dark" (singular enum)'``.

Wallpapers are restored at login from `~/.cache/wallpaper-current`, written by
`~/.config/hypr/wallpaper.sh` (mainMod+SHIFT+W picks one).

### Palette contract

Both palettes are exported from `themes/<name>/colors.nix` with the same
11-token contract — `background`, `panel`, `surface`, `foreground`, `muted`,
`border`, `borderActive`, `accent`, `accentDim`, `error`, `warning` — plus a
parallel `rgb` attrset holding the same names in `"R,G,B"` form for Qt stylesheet
generation. Every app module consumes only those tokens, so the two themes
differ in values, not in structure.

- `openbsd-dark` — flat and opaque: no blur, no transparency, no animations,
  square corners, OpenBSD's dark greys with a muted blue accent.
- `breakcore` — dark, rounded, transparent, with blur and animations enabled;
  near-black violet base, hot-magenta accent, cyan `borderActive`.

No credentials, VPN profiles, SSH keys, application data, or unrelated user
dotfiles are stored here.
