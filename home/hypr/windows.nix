{ ... }:

{
  wayland.windowManager.hyprland.settings =
  {
    animations =
    {
      enabled = "yes";
      bezier = "overshot, 0.13, 0.99, 0.29, 1.1";
      animation = 
      [
        "windowsIn, 1, 4, overshot, slide"
        "windowsOut, 1, 5, default, popin 80%"
        "border, 1, 5, default"
        "workspacesIn, 1, 6, overshot, slide"
        "workspacesOut, 1, 6, overshot, slidefade 80%"
      ];
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
    
    windowrule =
    [
      "float, class:^()$,title:^(Picture in picture)$"
      "float, class:^()$,title:^(Save File)$"
      "float, class:^()$,title:^(Open File)$"
      "float, class:^(xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland)(.*)$"
      "float, class:^(polkit-gnome-authentication-agent-1|hyprpolkitagent|org.org.kde.polkit-kde-authentication-agent-1)(.*)$"
      "float, class:^(zenity)$"
      "float, class:^()$,title:^(Steam - Self Updater)$"
      "float, title:^(Picture-in-Picture)$"
      "size 960 540, title:^(Picture-in-Picture)$"
      "move 25%-, title:^(Picture-in-Picture)$"
      "float, title:^(imv|mpv|danmufloat|termfloat|nemo|ncmpcpp)$"
      "move 25%-, title:^(imv|mpv|danmufloat|termfloat|nemo|ncmpcpp)$"
      "size 960 540, title:^(imv|mpv|danmufloat|termfloat|nemo|ncmpcpp)$"
      "pin, title:^(danmufloat)$"
      "rounding 5, title:^(danmufloat|termfloat)$"
      "animation slide right, class:^(kitty|Alacritty)$"
      "noblur, class:^(org.mozilla.firefox)$"
      "bordersize 2, floating:1, onworkspace:w[fv1-10]"
      "bordercolor $accent, floating:1, onworkspace:w[fv1-10]"
      "rounding 8, floating:1, onworkspace:w[fv1-10]"
      "bordersize 3, floating:0, onworkspace:f[1-10]"
      "rounding 4, floating:0, onworkspace:f[1-10]"
    ];

    workspace =
    [
      "w[tv1-10], gapsout:5, gapsin:3"
      "f[1], gapsout:5, gapsin:3"
    ];

    layerrule =
    [
      "animation slide top, logout_dialog"
      "animation slide down, waybar"
      "animation fade 50%, wallpaper"
      "noanim, waybar"
      "blur, waybar"
    ];
  };

}