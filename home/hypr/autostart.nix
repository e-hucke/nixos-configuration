{ ... }:

{
  wayland.windowManager.hyprland.settings =
  {
    exec-once =
    [
      "uwsm app -- waybar"
      "uwsm app -- nm-applet --indicator"
      "uwsm app -- wl-paste --type text --watch cliphist store"
      "uwsm app -- wl-paste --type image --watch cliphist store"
    ];
  };
}