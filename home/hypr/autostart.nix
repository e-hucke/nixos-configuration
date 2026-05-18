{ ... }:

{
  wayland.windowManager.hyprland.settings =
  {
    exec-once =
    {
      "nm-applet --indicator &"
      "bash -c 'mkfifo /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob && tail -f /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob | wob & disown' &"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"

      "systemctl --user import-environment &"
      "hash dbus-update-activation-environment 2>/dev/null &"
      "dbus-update-activation-environment --systemd &"
    };
  };
}