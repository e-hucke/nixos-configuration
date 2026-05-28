{ lib, ... }:

{
  wayland.windowManager.hyprland.settings =
  {
    bezier =
    {
      _args = [ "overshot" 0.13 0.99 0.29 1.1 ];
    };

    animation =
    [
      { _args = [ "windowsIn"     1 4 "overshot" "slide" ]; }
      { _args = [ "windowsOut"    1 5 "default"  "popin 80%" ]; }
      { _args = [ "border"        1 5 "default" ]; }
      { _args = [ "workspacesIn"  1 6 "overshot" "slide" ]; }
      { _args = [ "workspacesOut" 1 6 "overshot" "slidefade 80%" ]; }
    ];

    window_rule =
    [
      { match = { class = "^()$"; title = "^(Picture in picture)$"; }; float = true; }
      { match = { class = "^()$"; title = "^(Save File)$"; }; float = true; }
      { match = { class = "^()$"; title = "^(Open File)$"; }; float = true; }
      { match = { class = "^(xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland)(.*)$"; }; float = true; }
      { match = { class = "^(polkit-gnome-authentication-agent-1|hyprpolkitagent|org.org.kde.polkit-kde-authentication-agent-1)(.*)$"; }; float = true; }
      { match = { class = "^(zenity)$"; }; float = true; }
      { match = { class = "^()$"; title = "^(Steam - Self Updater)$"; }; float = true; }
      { match = { title = "^(Picture-in-Picture)$"; }; float = true; }
      { match = { title = "^(Picture-in-Picture)$"; }; size = "960 540"; }
      { match = { title = "^(Picture-in-Picture)$"; }; move = "25%-"; }
      { match = { title = "^(imv|mpv|danmufloat|termfloat|nemo|ncmpcpp)$"; }; float = true; }
      { match = { title = "^(imv|mpv|danmufloat|termfloat|nemo|ncmpcpp)$"; }; move = "25%-"; }
      { match = { title = "^(imv|mpv|danmufloat|termfloat|nemo|ncmpcpp)$"; }; size = "960 540"; }
      { match = { title = "^(danmufloat)$"; }; pin = true; }
      { match = { title = "^(danmufloat|termfloat)$"; }; rounding = 5; }
      { match = { class = "^(kitty|Alacritty)$"; }; animation = "slide right"; }
      { match = { class = "^(org.mozilla.firefox)$"; }; noblur = true; }
      { match = { float = true;  workspace = "w[fv1-10]"; }; border_size = 2; }
      { match = { float = true;  workspace = "w[fv1-10]"; }; border_color = lib.generators.mkLuaInline "accent"; }
      { match = { float = true;  workspace = "w[fv1-10]"; }; rounding = 8; }
      { match = { float = false; workspace = "f[1-10]"; }; border_size = 3; }
      { match = { float = false; workspace = "f[1-10]"; }; rounding = 4; }
    ];

    workspace_rule =
    [
      { match = { workspace = "w[tv1-10]"; }; gapsout = 5; gapsin = 3; }
      { match = { workspace = "f[1]"; }; gapsout = 5; gapsin = 3; }
    ];

    layer_rule =
    [
      { match = { namespace = "logout_dialog"; }; animation = "slide top"; }
      { match = { namespace = "waybar"; }; animation = "slide down"; }
      { match = { namespace = "wallpaper"; }; animation = "fade 50%"; }
      { match = { namespace = "waybar"; }; noanim = true; }
      { match = { namespace = "waybar"; }; blur = true; }
    ];

    config =
    {
      animations =
      {
        enabled = true;
      };

      decoration =
      {
        active_opacity = 1;
        rounding = 14;
        blur =
        {
          enabled = false;
        };
        shadow =
        {
          enabled = false;
        };
      };
    };
  };
}
