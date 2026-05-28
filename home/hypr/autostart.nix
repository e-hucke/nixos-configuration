{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.on =
  {
    _args =
    [
      "hyprland.start"
      (lib.generators.mkLuaInline ''
        function()
          hl.exec_cmd("uwsm app -- waybar")
          hl.exec_cmd("uwsm app -- nm-applet --indicator")
          hl.exec_cmd("uwsm app -- wl-paste --type text --watch cliphist store")
          hl.exec_cmd("uwsm app -- wl-paste --type image --watch cliphist store")
        end
      '')
    ];
  };
}
