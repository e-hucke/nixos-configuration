{ config, ... }:

{
  services.hyprpaper =
  {
    enable = true;

    settings =
    {
      splash = false;
      ipc = true;
      wallpaper =
      [
        {
          monitor = "";
          fit_mode = "cover";
          path = "${config.home.homeDirectory}/.local/share/hyprpaper-bgs/bg1.png";
        }
      ];
    };
  };

  home.file.".local/share/hyprpaper-bgs" =
  {
    source = ../assets/hyprpaper-bgs;
    recursive = true;
  };
}