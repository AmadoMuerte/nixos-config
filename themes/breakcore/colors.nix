
{
  background = "#11121b";
  panel = "#191a27";
  surface = "#222337";
  foreground = "#e3e2f2";
  muted = "#a5a4bd";
  border = "#303044";
  borderActive = "#a99ae8";
  accent = "#c4b5fd";
  accentDim = "#9384d5";
  error = "#ff7b91";
  warning = "#e8c994";

  # ANSI 0-15 for terminals that take the whole ramp as one value (ghostty).
  # Steps of the same violet hue rather than imported foreign colours: 0-7 are
  # the named tokens, 8-15 are their lighter counterparts.
  ansi = {
    black = "#11121b";
    red = "#ff7b91";
    green = "#a6e3a1";
    yellow = "#e8c994";
    blue = "#9384d5";
    magenta = "#c4b5fd";
    cyan = "#89dceb";
    white = "#a5a4bd";
    brightBlack = "#303044";
    brightRed = "#ff9db0";
    brightGreen = "#b9edb5";
    brightYellow = "#f0dcb0";
    brightBlue = "#a99ae8";
    brightMagenta = "#d8ccff";
    brightCyan = "#a4e9f4";
    brightWhite = "#e3e2f2";
  };

  # qt6ct stores QColor values as decimal triples.
  rgb = {
    background = "17,18,27";
    panel = "25,26,39";
    surface = "34,35,55";
    foreground = "227,226,242";
    muted = "165,164,189";
    border = "48,48,68";
    borderActive = "169,154,232";
    accent = "196,181,253";
    accentDim = "147,132,213";
    error = "255,123,145";
    warning = "232,201,148";
  };
}
