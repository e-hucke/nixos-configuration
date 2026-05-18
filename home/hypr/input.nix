{ ... }:

{
  wayland.windowManager.hyprland.settings =
  {
    cursor =
    {
      no_hardware_cursors = 0;
      use_cpu_buffer = 1;
    };

    input =
    {
      follow_mouse = 2;
      float_switch_override_focus = 2;
      sensitivity = 0;
      accel_profile = "flat";
    };

    misc =
    {
      middle_click_paste = false;
    };

    binds =
    {
      allow_workspace_cycles = 1;
      workspace_back_and_forth = 1;
      workspace_center_on = 1;
      movefocus_cycles_fullscreen = true;
      window_direction_monitor_fallback = true;
    };

    "$mainMod" = "SUPER";
    "$filemanager" = "thunar";
    "$applauncher" = "fuzzel"; 
    "$terminal" = "kitty";
    "$shot-region" = "grim -g '$(slurp)' ~/Pictures/Screenshots/$(date +'%Y%m%d_%H%M%S').png";
    "$shot-screen" = "grim ~/Pictures/Screenshots/$(date +'%Y%m%d_%H%M%S').png";

    bindd =
    [
      "$mainMod, RETURN, Opens your preferred terminal emulator ($terminal), exec, $terminal"
      "$mainMod, E, Opens your preferred filemanager ($filemanager), exec, $filemanager"
      "$mainMod, Q, Closes (not kill) current window, killactive,"
      "$mainMod SHIFT, M, Exits Hyprland by terminating the user sessions, exec, loginctl terminate-user ''"
      "$mainMod, B, Switches current window between floating and tiling mode, togglefloating,"
      "$mainMod, SPACE, Runs your application launcher, exec, $applauncher"
      "$mainMod, F, Toggles current window fullscreen mode, fullscreen"
      "$mainMod, Y, Pin current window (shows on all workspaces), pin"
      ", Print, Creates a screenshot of an area, exec, $shot-region," 
      "ALT, Print, Creates a screenshot of the active display, exec, $shot-screen,"
      "$mainMod, K, Toggles  current window group mode (ungroup all related), togglegroup,"
      "$mainMod, Tab, Switches to the next window in the group, changegroupactive, f"
      "$mainMod, L, Lock the screen, exec, hyprlock"

      "$mainMod, mouse:272, Move the window towards a direction, movewindow"
      "$mainMod SHIFT, left, Move active window to the left, movewindow, l"
      "$mainMod SHIFT, right, Move active window to the right, movewindow, r"
      "$mainMod SHIFT, up, Move active window upwards, movewindow, u"
      "$mainMod SHIFT, down, Move active window downwards, movewindow, d"
      "$mainMod, left, Move focus to the left, movefocus, l"
      "$mainMod, right,  Move focus to the right, movefocus, r"
      "$mainMod, up, Move focus upwards, movefocus, u"
      "$mainMod, down, Move focus downwards, movefocus, d"

      "$mainMod CTRL SHIFT, right, Resize to the right, resizeactive, 15 0"
      "$mainMod CTRL SHIFT, left, Resize to the left, resizeactive, -15 0"
      "$mainMod CTRL SHIFT, up, Resize upwards, resizeactive, 0 -15"
      "$mainMod CTRL SHIFT, down, Resize downwards, resizeactive, 0 15"
      "$mainMod CTRL SHIFT, l, Resize to the right, resizeactive, 15 0"
      "$mainMod CTRL SHIFT, h, Resize to the left, resizeactive, -15 0"
      "$mainMod CTRL SHIFT, k, Resize upwards, resizeactive, 0 -15"
      "$mainMod CTRL SHIFT, j, Resize downwards, resizeactive, 0 15"

      "$mainMod CTRL, 1, Move window and switch to workspace 1, movetoworkspace, 1"
      "$mainMod CTRL, 2, Move window and switch to workspace 2, movetoworkspace, 2"
      "$mainMod CTRL, 3, Move window and switch to workspace 3, movetoworkspace, 3"
      "$mainMod CTRL, 4, Move window and switch to workspace 4, movetoworkspace, 4"
      "$mainMod CTRL, 5, Move window and switch to workspace 5, movetoworkspace, 5"
      "$mainMod CTRL, 6, Move window and switch to workspace 6, movetoworkspace, 6"
      "$mainMod CTRL, 7, Move window and switch to workspace 7, movetoworkspace, 7"
      "$mainMod CTRL, 8, Move window and switch to workspace 8, movetoworkspace, 8"
      "$mainMod CTRL, 9, Move window and switch to workspace 9, movetoworkspace, 9"
      "$mainMod CTRL, 0, Move window and switch to workspace 10, movetoworkspace, 10"
      "$mainMod SHIFT, 1, Move window silently to workspace 1, movetoworkspacesilent, 1"
      "$mainMod SHIFT, 2, Move window silently to workspace 2, movetoworkspacesilent, 2"
      "$mainMod SHIFT, 3, Move window silently to workspace 3, movetoworkspacesilent, 3"
      "$mainMod SHIFT, 4, Move window silently to workspace 4, movetoworkspacesilent, 4"
      "$mainMod SHIFT, 5, Move window silently to workspace 5, movetoworkspacesilent, 5"
      "$mainMod SHIFT, 6, Move window silently to workspace 6, movetoworkspacesilent, 6"
      "$mainMod SHIFT, 7, Move window silently to workspace 7, movetoworkspacesilent, 7"
      "$mainMod SHIFT, 8, Move window silently to workspace 8, movetoworkspacesilent, 8"
      "$mainMod SHIFT, 9, Move window silently to workspace 9, movetoworkspacesilent, 9"
      "$mainMod SHIFT, 0, Move window silently to workspace 10, movetoworkspacesilent, 10"

      "$mainMod, 1, Switch to workspace 1, workspace, 1"
      "$mainMod, 2, Switch to workspace 2, workspace, 2"
      "$mainMod, 3, Switch to workspace 3, workspace, 3"
      "$mainMod, 4, Switch to workspace 4, workspace, 4"
      "$mainMod, 5, Switch to workspace 5, workspace, 5"
      "$mainMod, 6, Switch to workspace 6, workspace, 6"
      "$mainMod, 7, Switch to workspace 7, workspace, 7"
      "$mainMod, 8, Switch to workspace 8, workspace, 8"
      "$mainMod, 9, Switch to workspace 9, workspace, 9"
      "$mainMod, 0, Switch to workspace 10, workspace, 10"
    ];

    bind =
    [
      "$mainMod, V, exec, cliphist list | fuzzel --dmenu --with-nth 2 | cliphist decode | wl-copy"
      # todo "$mainMod SHIFT, F12, exec, ~/scripts/tv-control.sh"
    ];

    bindm =
    [
      "$mainMod, mouse:273, resizewindow"
      "$mainMod, mouse:272, movewindow"
    ];

    bindel =
    [
      '', XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{if($1>100) system("pactl set-sink-volume @DEFAULT_SINK@ 100%")}' && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob''
      ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"
      ", XF86AudioMute, exec, amixer sset Master toggle | sed -En '/\[on\]/ s/.*\[([0-9]+)%\].*/\1/ p; /\[off\]/ s/.*/0/p' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"
    ];
  };
}