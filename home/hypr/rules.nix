{ ... }:

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
    { match = { class = "dev.noctalia.Noctalia"; }; float = true; size = "1080 920"; }
    { match = { class = "^(net-runelite-client-RuneLite|net-runelite-launcher-Launcher)$"; title = "^(RuneLite Launcher)$"; }; float = true; }
   ];

   layer_rule =
   [
    {
      match =
      {
        namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$";
      };
      no_anim = true;
      ignore_alpha = 0.5;
      blur = true;
      blur_popups = true;
    }
   ];
   workspace_rule =
  [
    {
      workspace = "1";
      monitor = "desc:AOC CQ27G4 108R3JA004268";
      persistent = true;
      default = true;
    }
    {
      workspace = "2";
      monitor = "desc:AOC CQ27G4 108R3JA004268";
      persistent = true;
    }
    {
      workspace = "3";
      monitor = "desc:AOC CQ27G4 108R3JA004268";
      persistent = true;
    }
    {
      workspace = "4";
      monitor = "desc:Invalid Vendor Codename - RTK ANMITE 0x19201200";
      persistent = true;
      default = true;
    }
    {
      workspace = "5";
      monitor = "desc:Invalid Vendor Codename - RTK ANMITE 0x19201200";
      persistent = true;
    }
    {
      workspace = "6";
      monitor = "desc:Invalid Vendor Codename - RTK ANMITE 0x19201200";
      persistent = true;
    }
  ];
  };
}
