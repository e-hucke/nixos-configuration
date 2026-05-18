{ ... }:

{
  xdg.dataFile."xfce4/helpers/kitty.desktop".text =
  ''
    [Desktop Entry]
    NoDisplay=true
    Version=1.0
    Encoding=UTF-8
    Type=X-XFCE-Helper
    X-XFCE-Category=TerminalEmulator
    X-XFCE-CommandsWithParameter=kitty -e "%s"
    X-XFCE-Commands=kitty
    Icon=kitty
    Name=Kitty
  '';

  xdg.configFile."xfce4/helpers.rc".text =
  ''
    TerminalEmulator=kitty
  '';
}
