{ colors }:

let
  hex = color: builtins.replaceStrings [ "#" ] [ "" ] color;
in
{
  "fuzzel/theme.ini" = ''
    [main]
    font=JetBrainsMono Nerd Font:size=13, Terminus:size=13
    prompt="run: "
    placeholder=command or application
    width=46
    lines=10
    horizontal-pad=22
    vertical-pad=12
    inner-pad=10
    line-height=26
    match-mode=fzf
    show-actions=yes
    filter-desktop=yes
    match-counter=yes
    layer=overlay
    icons-enabled=yes
    icon-theme=Papirus-Dark

    [colors]
    background=${hex colors.background}f2
    text=${hex colors.foreground}ff
    prompt=${hex colors.accent}ff
    placeholder=${hex colors.muted}ff
    input=${hex colors.foreground}ff
    match=${hex colors.accent}ff
    selection=${hex colors.accent}ff
    selection-text=${hex colors.background}ff
    selection-match=${hex colors.background}ff
    counter=${hex colors.muted}ff
    border=${hex colors.border}ff

    [border]
    width=1
    radius=14
    selection-radius=10
  '';
}
