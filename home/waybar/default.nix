{ config, ... }:

{
  programs.waybar =
  {
    enable = true;
    settings =
    {
      layer = "top";
      position = "top";
      height = 28;
      margin-left = 0;
      margin-bottom = 0;
      margin-right = 0;
      spacing = 5;

      modules-left =
      [
        "hyprland/workspaces"
        "hyprland/window"
      ];
      modules-center =
      [
        "clock"
      ];
      modules-right =
      [
        "memory"
        "cpu"
        "custom/gpu"
        "wireplumber"
        "tray"
        "custom/power"      
      ];

      memory =
      {
        interval = 30;
        format = " {used:0.2f}/{total:0.0f}GB";
        on-click = "kitty -e btop";
      };

      "custom/power" =
      {
        format = "󰐥 ";
        tooltip = false;
        on-click = "wlogout";
      };

      clock =
      {
        format = "  {:%H:%M   %e %b}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        today-format = "<b>{}</b>";
      };
    
      cpu =
      {
        interval = 1;
        format = "{max_frequency}GHz<span color=\"darkgray\">|{usage}%</span>";
        max-length = 11;
        min-length = 11;
      };

      "custom/gpu" =
      {
        format = "{}";
        return-type = "json";
        interval = 5;
        exec = "${config.home.homeDirectory}/.local/share/scripts/waybar-gpu.sh";
        max-length = 11;
        min-length = 11;
      };

      "hyprland/workspaces" =
      {
        all-outputs = true;
        format = "{name}";
        on-scroll-up = "hyprctl dispatch workspace e+1 1>/dev/null";
        on-scroll-down = "hyprctl dispatch workspace e-1 1>/dev/null";
        sort-by-number = true;
        active-only = false;
      };

      "hyprland/window" =
      {
        max-length = 100;
        separate-outputs = true;
      };

      wireplumber =
      {
        on-click = "pavucontrol";
        on-click-right = "amixer sset Master toggle 1>/dev/null";
        format = "<span foreground='#fab387'>{icon}</span>{volume}%";
        format-muted = "";
        format-source = "";
        format-source-muted = "";
        format-icons =
        {
            default =
            [
              " "
              " "
              " "
            ];
        };
      };

      tray =
      {
        icon-size = 15;
        spacing = 5;
      };
    };
  };

  home.file.".local/share/scripts/waybar-gpu.sh" =
  {
    source = ../assets/scripts/waybar-gpu.sh;
    recursive = true;
  };

  imports =
  [
    ./styles.nix
  ];
}