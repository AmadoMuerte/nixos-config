# Packages installed system-wide. Grouped by use-case so it's easy to find
# anything. Search search.nixos.org for more.

{ config, lib, pkgs, ... }:

{
  # ── System packages ────────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    # ── Applications ────────────────────────────────────────────
    proton-pass                # Password manager (GUI)
    onlyoffice-desktopeditors
    obs-studio
    kdePackages.ark
    prismlauncher
    overskride                 # Bluetooth manager (GUI)
    fastfetch                  # System info on terminal start
    opencode                   # AI coding assistant
    steam
    telegram-desktop
    nwg-displays               # Multi-monitor configurator
    zed-editor                 # Code editor

    # ── System utilities ────────────────────────────────────────
    easyeffects
    pavucontrol                # Audio mixing / volume control
    bluez                      # Bluetooth stack (CLI)
    lua
    luajit
    luaPackages.luafilesystem
    nano
    wget
    ghostty                    # Terminal emulator
    nautilus                   # File manager
    fuzzel                     # Launcher / dmenu
    btop                       # System monitor (TUI)
    git
    jq
    curl
    matugen                    # Wallpaper → theme generator
    qpwgraph

    # ── Hyprland ecosystem ──────────────────────────────────────
    waybar                     # Status bar
    hyprland                   # Compositor
    hyprland-qtutils
    uwsm                       # Universal Wayland session manager
    grim                       # Screenshots
    slurp
    swappy
    cliphist                   # Clipboard history
    wl-clipboard               # Wayland clipboard
    awww                       # Wallpaper daemon
    hyprlock                   # Screen locker
    swaynotificationcenter     # Notification daemon

    # ── Hardware controls ───────────────────────────────────────
    pamixer                    # Audio control (CLI)
    brightnessctl              # Screen brightness (CLI)

    # ── Network ─────────────────────────────────────────────────
    networkmanager_dmenu       # Wi-Fi picker

    # ── Shell / development ─────────────────────────────────────
    docker-compose
    direnv
    psmisc
    fish
    zoxide                     # Smart cd
    fzf                        # Fuzzy finder
    eza                        # Better ls
    bat                        # Better cat
    gh

    # ── Theme ───────────────────────────────────────────────────
    adw-gtk3                   # libadwaita dark theme for GTK3
    gnome-themes-extra
    papirus-icon-theme
    qt6Packages.qt6ct
    libsForQt5.qt5ct
    glib                       # gsettings CLI
    dconf
    gsettings-desktop-schemas
  ];

  # ── nix-ld ────────────────────────────────────────────────────
  #
  # Allows running ordinary, unpatched Linux binaries.
  # Currently needed for the official Discord client so its
  # executable remains untouched (required for Krisp).
  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      # Discord / Electron
      glib
      gtk3
      nss
      nspr

      # Audio
      alsa-lib
      libpulseaudio
      pipewire

      # GTK / rendering
      atk
      at-spi2-atk
      at-spi2-core
      cairo
      pango
      gdk-pixbuf

      # Desktop integration
      cups
      dbus
      expat
      fontconfig
      freetype
      libnotify

      # Graphics
      libdrm
      libglvnd
      libgbm
      libva

      # X11 / Wayland
      libx11
      libxcb
      libxcomposite
      libxcursor
      libxdamage
      libxext
      libxfixes
      libxi
      libxrandr
      libxrender
      libxscrnsaver
      libxtst
      libxkbcommon
      libxshmfence
      wayland

      # Tray / menus
      libappindicator-gtk3
      libdbusmenu

      # Runtime
      libuuid
      libcxx
      stdenv.cc.cc
    ];
  };
}
