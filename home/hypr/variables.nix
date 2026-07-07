{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.config =
  {
    general =
    {
      gaps_in = 3;
      gaps_out = 5;
      border_size = 1;
      layout = "dwindle";
      snap.enabled = true;
    };

    misc =
    {
      font_family = "Fira Sans";
      splash_font_family = "Fira Sans";
      disable_hyprland_logo = true;
      enable_swallow = true;
      swallow_regex = "^(nautilus|nemo|thunar|dolphin|btrfs-assistant.)$";
      focus_on_activate = true;
    };

    animations.enabled = true;
    decoration =
    {
      active_opacity = 1;
      rounding = 10;
      blur =
      {
        enabled = true;
        size = 3;
        passes = 2;
        vibrancy = 0.1696;
      };
      shadow =
      {
        enabled = true;
        range = 4;
        render_power = 3;
        color = "0xee1a1a1a";
      };
    };
    render.direct_scanout = false;
  };
}
