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
    background=${hex colors.background}d9
    text=${hex colors.foreground}ff
    prompt=${hex colors.accent}ff
    placeholder=${hex colors.muted}ff
    input=${hex colors.foreground}ff
    match=${hex colors.accent}ff
    selection=${hex colors.accent}59
    selection-text=${hex colors.foreground}ff
    selection-match=${hex colors.borderActive}ff
    counter=${hex colors.muted}ff
    border=${hex colors.accent}ff

    [border]
    width=2
    radius=18
    selection-radius=12
  '';
}
