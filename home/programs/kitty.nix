{ ... }:

{
  programs.kitty =
  {
    enable = true;
   
    settings =
    {
      shell = "fish";
     
      font = "DejaVu Sans Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = "11.0";

      cursor = "#de99c7";
      cursor_text_color = "#1e1a1d";
      cursor_shape = "beam";
      cursor_blink_interval = "0.5";

      scrollback_lines = 20000;

      mouse_hide_wait = "3.0";

      url_color = "#de99c7";
      url_style = "curly";

      window_padding_width = 8;

      enable_audio_bell = false;
      visual_bell_duration = "0.0";

      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{bell_symbol}{activity_symbol}{title:^10}";

      active_tab_foreground = "#1e1a1d";
      active_tab_background = "#de99c7";
      inactive_tab_foreground = "#8a8091";
      inactive_tab_background = "#2d2830";

      background = "#1e1a1d";
      tab_bar_background = "#1e1a1d";

      foreground = "#d4cdd1";
      selection_foreground = "#1e1a1d";
      selection_background = "#de99c7";

      color0 = "#2d2830";
      color1 = "#c97082";
      color2 = "#7a9a7e";
      color3 = "#c9a55a";
      color4 = "#8a7aad";
      color5 = "#de99c7";
      color6 = "#b08aa5";
      color7 = "#d4cdd1";
      color8 = "#4a444d";
      color9 = "#d98a9a";
      color10 = "#8fb094";
      color11 = "#d5b76e";
      color12 = "#a08fc0";
      color13 = "#e8b4d4";
      color14 = "#c49eb8";
      color15 = "#efe8ec";
    };
  };
}
