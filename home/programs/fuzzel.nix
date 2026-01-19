{ pkgs, ... }:

{
  programs.fuzzel =
  {
    enable = true;

    settings =
    {
      main =
      {
        font = "Fira Sans Semibold:size=14";
        dpi-aware = "auto";
        icons = "yes";
        terminal = "kitty";
        layer = "overlay";
        prompt = "❯ ";
        icon-theme = "Papirus-Dark";
        lines = 10;
        width = 35;
        horizontal-pad = 14;
        vertical-pad = 10;
        inner-pad = 8;
      };
      border =
      {
        width = 2;
        radius = 14;
      };
      colors =
      {
        background = "1e1a1dff";
        text = "d4cdd1ff";
        match = "de99c7ff";
        selection = "de99c7ff";
        selection-text = "1e1a1dff";
        border = "3d363bff";
      };
    };
  };
}