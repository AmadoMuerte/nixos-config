{ colors }:

let
  hex = color: builtins.replaceStrings [ "#" ] [ "" ] color;
in
{
  "fuzzel/theme.ini" = ''
    [main]
    font=Terminus:size=13
    prompt="run: "
    placeholder=command or application
    width=42
    lines=10
    horizontal-pad=8
    vertical-pad=6
    inner-pad=4
    line-height=20
    match-mode=fzf
    show-actions=yes
    filter-desktop=yes
    match-counter=yes
    layer=overlay
    icons-enabled=no

    [colors]
    background=${hex colors.background}ff
    text=${hex colors.foreground}ff
    prompt=${hex colors.accent}ff
    placeholder=${hex colors.muted}ff
    input=${hex colors.foreground}ff
    match=${hex colors.accent}ff
    selection=${hex colors.surface}ff
    selection-text=${hex colors.foreground}ff
    selection-match=${hex colors.accent}ff
    counter=${hex colors.muted}ff
    border=${hex colors.borderActive}ff

    [border]
    width=1
    radius=0
    selection-radius=0
  '';
}
