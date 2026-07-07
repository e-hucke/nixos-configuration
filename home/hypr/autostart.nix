{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.on =
  {
    _args =
    [
      "hyprland.start"
      (lib.generators.mkLuaInline ''
        function()
          hl.exec_cmd("uwsm app -- nm-applet --indicator")
          hl.exec_cmd("uwsm app -- bash -c 'echo detect > /sys/class/drm/card1-DP-3/status'")
          hl.exec_cmd("uwsm app -- env LD_LIBRARY_PATH=/run/opengl-driver/lib noctalia")
        end
      '')
    ];
  };
}
