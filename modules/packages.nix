# Packages installed system-wide. Grouped by use-case so it's easy to find
# anything. Search nixos.org for more.

{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # ── Applications ────────────────────────────────────────────
    kdePackages.ark
    prismlauncher
    spotify
    overskride                 # bluetooth manager (GUI)
    fastfetch                  # system info on terminal start
    opencode                   # AI coding assistant
    throne                     # VPN client
    steam
    telegram-desktop
    discord                # discord public test build
    nwg-displays               # multi-monitor configurator
    zed-editor                 # code editor

    # ── System utilities ────────────────────────────────────────
    easyeffects
    pavucontrol                # audio mixing / volume control
    bluez                      # bluetooth stack (CLI)
    lua
    luajit
    luaPackages.luafilesystem
    nano
    wget
    ghostty                    # terminal emulator
    nautilus                   # file manager
    fuzzel                     # launcher / dmenu
    btop                       # system monitor (TUI)
    git
    jq
    curl
    matugen                    # wallpaper → theme generator

    # ── Hyprland ecosystem ──────────────────────────────────────
    waybar                     # status bar
    hyprland                   # compositor
    hyprland-qtutils
    uwsm                       # universal wayland session manager
    grim                       # screenshot region picker
    slurp
    swappy
    cliphist                   # clipboard history
    wl-clipboard               # wayland clipboard
    awww                       # wallpaper daemon
    hyprlock                   # screen locker
    swaynotificationcenter     # notification daemon

    # ── Hardware controls ───────────────────────────────────────
    pamixer                    # audio control (CLI)
    brightnessctl              # screen brightness (CLI)

    # ── Network ─────────────────────────────────────────────────
    networkmanager_dmenu       # wifi picker (fuzzel-based)

    # ── Shell ───────────────────────────────────────────────────
    docker-compose
    direnv
    psmisc
    fish
    zoxide                     # smart `cd`
    fzf                        # fuzzy finder
    eza                        # better `ls`
    bat                        # better `cat`
    gh
    git
 
    # ── Theme ───────────────────────────────────────────────────
    adw-gtk3                   # libadwaita dark theme for GTK3 apps
    gnome-themes-extra
    papirus-icon-theme         # icon theme (Papirus-Dark)
    qt6Packages.qt6ct          # Qt6 theming tool
    libsForQt5.qt5ct           # Qt5 theming tool
    glib                       # gsettings CLI
    dconf                      # dconf CLI
    gsettings-desktop-schemas  # schemas required by gsettings
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
