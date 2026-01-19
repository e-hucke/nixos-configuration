{ ... }:

{
  programs.hyprlock =
  {
    enable = true;
    
    settings =
    {
      general = 
      {
        disable_loading_bar = false;
        hide_cursor = true;
        grace = 0;
        no_fade_in = false;
        no_fade_out = false;
        ignore_empty_input = true;
      };
      background = 
      {
        monitor = "";
        path = "screenshot";
        blur_passes = 3;
        blur_size = 5;
        noise = 0.0117;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      };
      label =
      {
        monitor = "";
        text = ''cmd[update:1000] echo "$(date +"%I:%M %p")"'';
        color = "rgba(212, 205, 209, 1.0)";
        font_size = 72;
        font_family = "Fira Sans";
        position = "0, 150";
        halign = "center";
        valign = "center";
      };
      label =
      {
        monitor = "";
        text = ''cmd[update:1000] echo "$(date +"%A, %d %B")"'';
        color = "rgba(212, 205, 209, 1.0)";
        font_size = 20;
        font_family = "Fira Sans";
        position = "0, 70";
        halign = "center";
        valign = "center";
      };
      input-field = 
      {
        monitor = "";
        size = "300, 50";
        outline_thickness = 3;
        dots_size = 0.33;
        dots_spacing = 0.15;
        dots_center = true;
        dots_rounding = -1;
        outer_color = "rgba(222, 153, 199, 1.0)";
        inner_color = "rgba(30, 26, 29, 1.0)";
        font_color = "rgba(212, 205, 209, 1.0)";
        fade_on_empty = false;
        fade_timeout = 1000;
        placeholder_text = "<i>Enter Password...</i>";
        hide_input = false;
        rounding = -1;
        check_color = "rgba(176, 138, 165, 1.0)";
        fail_color = "rgba(201, 112, 130, 1.0)";
        fail_text = "<i>$FAIL</i>";
        fail_timeout = 2000;
        fail_transition = 300;
        capslock_color = "rgba(138, 122, 173, 1.0)";
        numlock_color = -1;
        bothlock_color = -1;
        invert_numlock = false;
        swap_font_color = false;
        position = "0, -50";
        halign = "center";
        valign = "center";
      };
    };
  };
}