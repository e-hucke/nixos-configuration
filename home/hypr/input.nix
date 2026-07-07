{ lib, ... }:

let
  inherit (lib.generators) mkLuaInline;
  mk    = key: dsp:       { _args = [ (mkLuaInline key) (mkLuaInline dsp) ]; };
in

{
  wayland.windowManager.hyprland.settings =
  {
    mainMod     = { _var = "SUPER"; };
    filemanager = { _var = "dolphin"; };
    terminal    = { _var = "kitty"; };
    ipc         = { _var = "noctalia msg"; };

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

       plugin =
      {
        dynamic_cursors =
        {
          mode = "none";
          shake =
          {
            enabled = true;
            timeout = 1000;
            speed = 5.0;
          };
        };
      };

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
      (mk ''mainMod .. " + SPACE"''          ''hl.dsp.exec_cmd(ipc .. " panel-toggle launcher")'')
      (mk ''mainMod .. " + S"''              ''hl.dsp.exec_cmd(ipc .. " panel-toggle control-center")'')      
      (mk ''mainMod .. " + comma"''          ''hl.dsp.exec_cmd(ipc .. " settings-toggle")'')      
      (mk ''mainMod .. " + F"''              ''hl.dsp.window.fullscreen()'')
      (mk ''mainMod .. " + SHIFT + O"''      ''hl.dsp.exec_cmd(ipc .. " screenshot-region")'')
      (mk ''mainMod .. " + SHIFT + P"''      ''hl.dsp.exec_cmd(ipc .. " screenshot-fullscreen")'')
      (mk ''mainMod .. " + L"''              ''hl.dsp.exec_cmd(ipc .. " session lock")'')
      (mk ''mainMod .. " + V"''              ''hl.dsp.exec_cmd(ipc .. " panel-toggle clipboard")'')
      (mk ''mainMod .. " + Tab"''            ''hl.dsp.exec_cmd(ipc .. " window-switcher")'')
      (mk ''mainMod .. " + P"''              ''hl.dsp.exec_cmd(ipc .. " panel-toggle noctalia/notes:panel")'')

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
    
      (mk ''mainMod .. " + SHIFT + F12"'' ''hl.dsp.exec_cmd("~/.local/share/scripts/hypr-monitor-menu.sh")'')

      (mk ''mainMod .. " + mouse:273"'' ''hl.dsp.window.resize()'')
      (mk ''mainMod .. " + mouse:272"'' ''hl.dsp.window.drag()'')

      (mk ''"XF86AudioRaiseVolume"''    ''hl.dsp.exec_cmd(ipc .. " volume-up")'')
      (mk ''"XF86AudioLowerVolume"''    ''hl.dsp.exec_cmd(ipc .. " volume-down")'')
      (mk ''"XF86AudioMute"''           ''hl.dsp.exec_cmd(ipc .. " volume-mute")'')
      (mk ''"XF86MonBrightnessUp"''     ''hl.dsp.exec_cmd(ipc .. " brightness-up")'')
      (mk ''"XF86MonBrightnessDown"''   ''hl.dsp.exec_cmd(ipc .. " brightness-down")'')

    ]
    ++ builtins.concatLists (builtins.genList (i:
      let
        ws  = i + 1;
        key = if ws == 10 then "0" else toString ws;
      in
      [
        (mk ''mainMod .. " + ${key}"''         ''hl.dsp.focus({workspace = ${toString ws}})'')
        (mk ''mainMod .. " + CTRL + ${key}"''  ''hl.dsp.window.move({workspace = ${toString ws}})'')
        (mk ''mainMod .. " + SHIFT + ${key}"'' ''hl.dsp.window.move({workspace = ${toString ws}, follow = false })'')
      ]
    ) 10);
  };
}
