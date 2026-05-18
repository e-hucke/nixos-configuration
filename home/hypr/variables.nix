{ ... }:

{
  wayland.windowManager.hyprland.settings =
  {
    general =
    {
      gaps_in = 3;
      gaps_out = 5;
      border_size = 2;
      col.active_border = "$accent";
      col.inactive_border = "$bgHover";
      layout = "dwindle";
      snap =
      {
        enabled = true;
      };
    };

    group =
    {
      col.border_active = "$accent";
      col.border_inactive = "$lavender";
      col.border_locked_active = "$purple";
      col.border_locked_inactive = "$textMuted";

      groupbar =
      {
        font_family = "Fira Sans Semibold";
        text_color = "$textPrimary";
        col.active = "$accent";
        col.inactive = "$bgHover";
        col.locked_active = "$purple";
        col.locked_inactive = "$bgLight";
      };
    };

    misc =
    {
      font_family = "Fira Sans";
      splash_font_family = "Fira Sans";
      disable_hyprland_logo = true;
      col.splash = "$accent";
      background_color = "$bgLight";
      enable_swallow = true;
      swallow_regex = "^(nautilus|nemo|thunar|btrfs-assistant.)$";
      focus_on_activate = true;
    };

    render =
    {
      direct_scanout = true;
    };

    dwindle =
    {
      special_scale_factor = 0.8;
      pseudotile = true;
      preserve_split = true;
    };
  };

}