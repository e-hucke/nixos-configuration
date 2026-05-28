{ lib, ... }:

let
  inherit (lib.generators) mkLuaInline;

  mk    = key: dsp:       { _args = [ (mkLuaInline key) (mkLuaInline dsp) ]; };
  mkOpt = key: dsp: opts: { _args = [ (mkLuaInline key) (mkLuaInline dsp) opts ]; };
in

{
  wayland.windowManager.hyprland.settings =
  {
    mainMod     = { _var = "SUPER"; };
    filemanager = { _var = "thunar"; };
    applauncher = { _var = "fuzzel"; };
    terminal    = { _var = "kitty"; };
    shot_region = { _var = "grim -g '$(slurp)' ~/Pictures/Screenshots/$(date +'%Y%m%d_%H%M%S').png"; };
    shot_screen = { _var = "grim ~/Pictures/Screenshots/$(date +'%Y%m%d_%H%M%S').png"; };

    config =
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

      misc.middle_click_paste = false;

      binds =
      {
        allow_workspace_cycles = 1;
        workspace_back_and_forth = 1;
        workspace_center_on = 1;
        movefocus_cycles_fullscreen = true;
        window_direction_monitor_fallback = true;
      };
    };

    bind =
    [
      (mk ''mainMod .. " + RETURN"''         ''hl.dsp.exec_cmd(terminal)'')
      (mk ''mainMod .. " + E"''              ''hl.dsp.exec_cmd(filemanager)'')
      (mk ''mainMod .. " + Q"''              ''hl.dsp.window.close()'')
      (mk ''mainMod .. " + SHIFT + M"''      ''hl.dsp.exec_cmd([[loginctl terminate-user ""]])'')
      (mk ''mainMod .. " + B"''              ''hl.dsp.window.float({ action = "toggle" })'')
      (mk ''mainMod .. " + SPACE"''          ''hl.dsp.exec_cmd(applauncher)'')
      (mk ''mainMod .. " + F"''              ''hl.dsp.window.fullscreen()'')
      (mk ''mainMod .. " + Y"''              ''hl.dsp.window.pin()'')
      (mk ''"Print"''                        ''hl.dsp.exec_cmd(shot_region)'')
      (mk ''"ALT + Print"''                  ''hl.dsp.exec_cmd(shot_screen)'')
      (mk ''mainMod .. " + K"''              ''hl.dsp.group.toggle()'')
      (mk ''mainMod .. " + Tab"''            ''hl.dsp.group.next()'')
      (mk ''mainMod .. " + L"''              ''hl.dsp.exec_cmd("hyprlock")'')

      (mk ''mainMod .. " + SHIFT + left"''   ''hl.dsp.window.move({ direction = "l" })'')
      (mk ''mainMod .. " + SHIFT + right"''  ''hl.dsp.window.move({ direction = "r" })'')
      (mk ''mainMod .. " + SHIFT + up"''     ''hl.dsp.window.move({ direction = "u" })'')
      (mk ''mainMod .. " + SHIFT + down"''   ''hl.dsp.window.move({ direction = "d" })'')

      (mk ''mainMod .. " + left"''           ''hl.dsp.focus({ direction = "l" })'')
      (mk ''mainMod .. " + right"''          ''hl.dsp.focus({ direction = "r" })'')
      (mk ''mainMod .. " + up"''             ''hl.dsp.focus({ direction = "u" })'')
      (mk ''mainMod .. " + down"''           ''hl.dsp.focus({ direction = "d" })'')

      (mk ''mainMod .. " + CTRL + SHIFT + right"''  ''hl.dsp.window.resize({ x = 15,  y = 0,   relative = true })'')
      (mk ''mainMod .. " + CTRL + SHIFT + left"''   ''hl.dsp.window.resize({ x = -15, y = 0,   relative = true })'')
      (mk ''mainMod .. " + CTRL + SHIFT + up"''     ''hl.dsp.window.resize({ x = 0,   y = -15, relative = true })'')
      (mk ''mainMod .. " + CTRL + SHIFT + down"''   ''hl.dsp.window.resize({ x = 0,   y = 15,  relative = true })'')
      (mk ''mainMod .. " + CTRL + SHIFT + l"''      ''hl.dsp.window.resize({ x = 15,  y = 0,   relative = true })'')
      (mk ''mainMod .. " + CTRL + SHIFT + h"''      ''hl.dsp.window.resize({ x = -15, y = 0,   relative = true })'')
      (mk ''mainMod .. " + CTRL + SHIFT + k"''      ''hl.dsp.window.resize({ x = 0,   y = -15, relative = true })'')
      (mk ''mainMod .. " + CTRL + SHIFT + j"''      ''hl.dsp.window.resize({ x = 0,   y = 15,  relative = true })'')

      (mk ''mainMod .. " + V"'' ''hl.dsp.exec_cmd([[cliphist list | fuzzel --dmenu --with-nth 2 | cliphist decode | wl-copy]])'')
      (mk ''mainMod .. " + SHIFT + F12"'' ''hl.dsp.exec_cmd("~/.local/share/scripts/hypr-monitor-menu.sh")'')

      (mk ''mainMod .. " + mouse:273"'' ''hl.dsp.window.resize()'')
      (mk ''mainMod .. " + mouse:272"'' ''hl.dsp.window.drag()'')

      (mkOpt ''"XF86AudioRaiseVolume"''
             ''hl.dsp.exec_cmd([[pamixer -i 5 && pamixer --get-volume > $XDG_RUNTIME_DIR/wob.sock]])''
             { locked = true; repeating = true; })
      (mkOpt ''"XF86AudioLowerVolume"''
             ''hl.dsp.exec_cmd([[pamixer -d 5 && pamixer --get-volume > $XDG_RUNTIME_DIR/wob.sock]])''
             { locked = true; repeating = true; })
      (mkOpt ''"XF86AudioMute"''
             ''hl.dsp.exec_cmd([[pamixer -t && { pamixer --get-mute | grep -q true && echo "0 muted" || pamixer --get-volume; } > $XDG_RUNTIME_DIR/wob.sock]])''
             { locked = true; repeating = true; })
    ]
    ++ builtins.concatLists (builtins.genList (i:
      let
        ws  = i + 1;
        key = if ws == 10 then "0" else toString ws;
      in
      [
        (mk ''mainMod .. " + ${key}"''         ''hl.dsp.focus({workspace = ${toString ws}})'')
        (mk ''mainMod .. " + CTRL + ${key}"''  ''hl.dsp.window.move({workspace = ${toString ws}})'')
        (mk ''mainMod .. " + SHIFT + ${key}"'' ''hl.dsp.window.move({workspace = ${toString ws}, { follow = true }})'')
      ]
    ) 10);
  };
}
