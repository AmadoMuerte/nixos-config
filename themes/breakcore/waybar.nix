
{ colors }:

let
  # Midnight Violet: deep blue-black surfaces, muted lavender accents.
  # Every value comes from colors.nix -- do not re-declare palette literals
  # here. Translucent edges use colors.rgb (decimal triples), solids colors.*.
  ax = {
    hex = {
      background = colors.background;
      border = colors.border;
      foreground = colors.foreground;
      muted = colors.muted;
      accent = colors.accent;
      warning = colors.warning;
      error = colors.error;
    };
    rgb = colors.rgb;
  };
in
{
  "waybar/theme.css" = ''
    /* ---------- global ---------- */

    * {
        font-family: "JetBrainsMono Nerd Font", "Terminus", monospace;
        font-size: 13px;
        border: none;
        border-radius: 0;
        min-height: 0;
        box-shadow: none;
    }

    window#waybar {
        background: transparent;
        border: none;
        box-shadow: none;
    }

    /* ---------- containers ---------- */

    .modules-left,
    .modules-center,
    .modules-right {
        background: rgba(${ax.rgb.background}, 0.94);
        border: none;
        border-radius: 14px;
        margin: 0px 4px;
        padding: 0;
        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.38);
    }

    tooltip {
        background: rgba(${ax.rgb.background}, 0.97);
        color: ${ax.hex.foreground};
        border: 1px solid rgba(${ax.rgb.border}, 0.70);
        border-radius: 14px;
        padding: 6px 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.45);
    }

    /* ---------- workspaces ---------- */

    #workspaces {
        background: transparent;
        border: none;
        border-radius: 14px;
        padding: 0 4px;
        margin: 0;
        box-shadow: none;
    }

    #workspaces button {
        background: transparent;
        color: rgba(${ax.rgb.muted}, 0.78);
        border: none;
        border-radius: 14px;
        box-shadow: none;
        padding: 0 9px;
        margin: 4px 2px;
        font-weight: 600;
        transition: background-color 120ms ease, color 120ms ease;
    }

    #workspaces button:hover {
        background: rgba(${ax.rgb.border}, 0.72);
        color: ${ax.hex.foreground};
        border: none;
        border-radius: 14px;
        box-shadow: none;
    }

    #workspaces button.active {
        background: ${ax.hex.accent};
        color: ${ax.hex.background};
        border: none;
        border-radius: 14px;
        padding: 0 18px;
        box-shadow: none;
    }

    #workspaces button.urgent {
        background: ${ax.hex.error};
        color: ${ax.hex.background};
        border: none;
        border-radius: 14px;
        box-shadow: none;
    }

    /* ---------- shared modules ---------- */

    #custom-host,
    #custom-ai-quota,
    #custom-system-load,
    #custom-opencode-remote,
    #cpu,
    #memory,
    #temperature,
    #network,
    #bluetooth,
    #pulseaudio,
    #custom-kb_layout,
    #tray,
    #custom-notification,
    #clock {
        background: transparent;
        background-image: none;
        color: ${ax.hex.foreground};
        border: none;
        border-radius: 14px;
        box-shadow: none;
        padding: 0 8px;
        margin: 4px 2px;
        min-height: 0;
        transition: background-color 120ms ease, color 120ms ease;
    }

    /* ---------- hover ---------- */

    #custom-host:hover,
    #custom-ai-quota:hover,
    #custom-system-load:hover,
    #custom-opencode-remote:hover,
    #cpu:hover,
    #memory:hover,
    #temperature:hover,
    #network:hover,
    #bluetooth:hover,
    #pulseaudio:hover,
    #custom-kb_layout:hover,
    #custom-notification:hover,
    #clock:hover {
        background: rgba(${ax.rgb.border}, 0.62);
        background-image: none;
        color: ${ax.hex.foreground};
        border: none;
        border-radius: 14px;
        box-shadow: none;
    }

    /* ---------- outer edges ---------- */

    .modules-left > widget:first-child,
    .modules-center > widget:first-child,
    .modules-right > widget:first-child {
        margin-left: 0;
    }

    .modules-left > widget:last-child,
    .modules-center > widget:last-child,
    .modules-right > widget:last-child {
        margin-right: 0;
    }

    /* ---------- left ---------- */

    #custom-ai-quota,
    #custom-opencode-remote {
        color: ${ax.hex.muted};
    }

    #custom-ai-quota.fallback,
    #custom-opencode-remote.fallback {
        color: ${ax.hex.muted};
        opacity: 0.68;
    }

    #custom-opencode-remote {
        padding: 0 10px;
        margin: 4px 3px;
        font-weight: 600;
    }

    #custom-opencode-remote.inactive {
        opacity: 0.55;
    }

    #custom-opencode-remote.active,
    #custom-opencode-remote.error {
        opacity: 1;
    }

    /* ---------- center ---------- */

    #custom-host {
        color: ${ax.hex.foreground};
        font-weight: 600;
        letter-spacing: 1px;
    }

    /* ---------- system load: CPU + GPU ---------- */

    #custom-system-load,
    #custom-system-load *,
    #custom-system-load widget,
    #custom-system-load label {
        background: transparent;
        background-color: transparent;
        background-image: none;
        border: none;
        outline: none;
        box-shadow: none;
    }

    #custom-system-load {
        color: ${ax.hex.foreground};
        padding: 0 7px;
        margin: 4px 2px;
        border: none;
        border-left: none;
        border-radius: 14px;
        box-shadow: none;
    }

    #custom-system-load:hover {
        background: rgba(${ax.rgb.border}, 0.62);
        background-image: none;
        border: none;
        border-left: none;
        border-radius: 14px;
        box-shadow: none;
    }

    #custom-system-load.warning {
        color: ${ax.hex.warning};
    }

    #custom-system-load.critical {
        color: ${ax.hex.error};
    }

    /* Fallback for separately exposed CPU/GPU widgets. */

    #cpu,
    #cpu *,
    #gpu,
    #gpu * {
        background: transparent;
        background-color: transparent;
        background-image: none;
        border: none;
        outline: none;
        box-shadow: none;
        border-radius: 14px;
    }

    #cpu,
    #gpu {
        color: ${ax.hex.foreground};
    }

    #cpu:hover,
    #gpu:hover {
        background: rgba(${ax.rgb.border}, 0.62);
        background-image: none;
        border: none;
        border-radius: 14px;
        box-shadow: none;
    }

    /* ---------- right ---------- */

    #bluetooth,
    #custom-kb_layout {
        border-left: none;
    }

    #memory.warning,
    #custom-ai-quota.warning,
    #temperature.warning {
        color: ${ax.hex.warning};
    }

    #memory.critical,
    #temperature.critical,
    #network.disconnected,
    #custom-ai-quota.critical,
    #custom-ai-quota.error {
        color: ${ax.hex.error};
    }

    #pulseaudio.muted,
    #bluetooth.disabled,
    #bluetooth.off {
        color: ${ax.hex.muted};
    }

    /* ---------- tray ---------- */

    #tray {
        padding: 0 4px;
        margin: 4px 0;
    }

    #tray > widget {
        margin: 0 2px;
        border: none;
        border-radius: 14px;
        box-shadow: none;
    }

    #tray > .passive {
        -gtk-icon-effect: dim;
    }

    #tray > .needs-attention {
        -gtk-icon-effect: highlight;
    }

    /* ---------- notifications ---------- */

    #custom-notification {
        color: ${ax.hex.muted};
        padding: 0 5px;
        margin: 4px 0;
        border-radius: 14px;
    }

    #custom-notification:hover {
        background: rgba(${ax.rgb.border}, 0.62);
        border-radius: 14px;
    }

    /* ---------- clock ---------- */

    #clock {
        color: ${ax.hex.foreground};
        font-weight: 700;
        padding: 0 8px 0 4px;
        margin: 4px 0;
        border-radius: 14px;
    }

    #clock:hover {
        background: rgba(${ax.rgb.border}, 0.62);
        border-radius: 14px;
    }
  '';
}
