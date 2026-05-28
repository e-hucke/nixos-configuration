{ ... }:

{
  wayland.windowManager.hyprland.settings.monitor =
  [
    { _args = [{ output = "DP-5"; mode = "2560x1440@180"; position = "0x0"; scale = 1; vrr = 1; }]; }
    { _args = [{ output = "DP-6"; mode = "1920x1200@60"; position = "2560x-240"; scale = 1; transform = 3; }]; }
    { _args = [{ output = "HDMI-A-2"; disabled = true; }]; }
    { _args = [{ output = ""; mode = "preferred"; position = "auto"; scale = 1; }]; }
  ];
}
