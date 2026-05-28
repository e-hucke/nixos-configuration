{ lib, ... }:

{
  wayland.windowManager.hyprland.settings =
  {

   window_rule =
   [
    { match = { class = "^()$"; title = "^(Picture in picture)$"; }; float = true; }
    { match = { class = "^()$"; title = "^(Save File)$"; }; float = true; }
    { match = { class = "^()$"; title = "^(Open File)$"; }; float = true; }
    { match = { class = "^(xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland)(.*)$"; }; float = true; }
    { match = { class = "^(polkit-gnome-authentication-agent-1|hyprpolkitagent|org.org.kde.polkit-kde-authentication-agent-1)(.*)$"; }; float = true; }
    { match = { class = "^()$"; title = "^(Steam - Self Updater)$"; }; float = true; }
    { match = { title = "^(Picture-in-Picture)$"; }; float = true; }
    { match = { title = "^(Picture-in-Picture)$"; }; size = "960 540"; }
    { match = { title = "^(imv|mpv|danmufloat|termfloat|nemo|ncmpcpp)$"; }; float = true; }
    { match = { title = "^(imv|mpv|danmufloat|termfloat|nemo|ncmpcpp)$"; }; size = "960 540"; }
   ];

   layer_rule =
   [
    { match = { namespace = "waybar"; }; no_anim = true; }
    { match = { namespace = "waybar"; }; blur = true; }
   ];

   config =
   {
     animations.enabled = true;
     decoration =
     {
       active_opacity = 1;
       blur.enabled = false;
       shadow.enabled = false;
     };
   };
  };
}
