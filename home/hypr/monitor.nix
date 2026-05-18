{ ... }:

{
  wayland.windowManager.hyprland.settings =
  {
    env = "ELECTRON_OZONE_PLATFORM_HINT, auto";
    monitor =
    [
      "DP-5, 2560x1440@180, 0x0, 1, vrr, 2"
      "DP-6, 1920x1200@60, -1200x-200, 1, transform, 3"
      "HDMI-A-2, disable"
      ", preferred, auto, 1"
    ];
  };
  
}