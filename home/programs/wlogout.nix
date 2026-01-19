{ config, ... }:

{
  programs.wlogout =
  {
    enable = true;

    layout =
    [
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];

    style =
    ''
      * {
        background-image: none;
        box-shadow: none;
      }
      window {
        background-color: rgba(30, 26, 29, 0.9);
      }
      button {
        border-radius: 12px;
        border-color: #3d363b;
        text-decoration-color: #d4cdd1;
        color: #d4cdd1;
        background-color: #1e1a1d;
        border-style: solid;
        border-width: 2px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        margin: 8px;
      }
      button:focus, button:active, button:hover {
        background-color: #2d2830;
        border-color: #de99c7;
        color: #de99c7;
        outline-style: none;
      }
      #lock {
        background-image: image(url("${config.home.homeDirectory}/.local/share/wlogout-icons/lock.svg"));
      }
      #logout {
        background-image: image(url("${config.home.homeDirectory}/.local/share/wlogout-icons/logout.svg"));
      }
      #suspend {
        background-image: image(url("${config.home.homeDirectory}/.local/share/wlogout-icons/suspend.svg"));
      }
      #hibernate {
        background-image: image(url("${config.home.homeDirectory}/.local/share/wlogout-icons/hibernate.svg"));
      }
      #shutdown {
        background-image: image(url("${config.home.homeDirectory}/.local/share/wlogout-icons/shutdown.svg"));
      }
      #reboot {
        background-image: image(url("${config.home.homeDirectory}/.local/share/wlogout-icons/reboot.svg"));
      }  
    '';
  };

  home.file.".local/share/wlogout-icons" =
  {
    source = ../assets/wlogout-icons;
    recursive = true;
  };
}