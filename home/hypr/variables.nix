{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.config =
  {
    general =
    {
      gaps_in = 3;
      gaps_out = 5;
      border_size = 1;
      "col.active_border" = lib.generators.mkLuaInline "accent";
      "col.inactive_border" = lib.generators.mkLuaInline "bgHover";
      layout = "dwindle";
      snap.enabled = true;
    };

    group =
    {
      "col.border_active" = lib.generators.mkLuaInline "accent";
      "col.border_inactive" = lib.generators.mkLuaInline "lavender";
      "col.border_locked_active" = lib.generators.mkLuaInline "purple";
      "col.border_locked_inactive" = lib.generators.mkLuaInline "textMuted";

      groupbar =
      {
        font_family = "Fira Sans Semibold";
        text_color = lib.generators.mkLuaInline "textPrimary";
        "col.active" = lib.generators.mkLuaInline "accent";
        "col.inactive" = lib.generators.mkLuaInline "bgHover";
        "col.locked_active" = lib.generators.mkLuaInline "purple";
        "col.locked_inactive" = lib.generators.mkLuaInline "bgLight";
      };
    };

    misc =
    {
      font_family = "Fira Sans";
      splash_font_family = "Fira Sans";
      disable_hyprland_logo = true;
      "col.splash" = lib.generators.mkLuaInline "accent";
      background_color = lib.generators.mkLuaInline "bgLight";
      enable_swallow = true;
      swallow_regex = "^(nautilus|nemo|thunar|btrfs-assistant.)$";
      focus_on_activate = true;
    };

    render.direct_scanout = false;
  };
}
