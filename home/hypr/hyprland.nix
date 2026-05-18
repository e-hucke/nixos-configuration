{ ... }:

{
  wayland.windowManager.hyprland =
  {
    enable = true;
    package = null;
    systemd.enable = false;
    
    settings.envd =
    [
      "HYPRCURSOR_SIZE,24"
      "XCURSOR_SIZE,24"
      "QT_CURSOR_SIZE,24"
    ];
  };
  imports =
  [
    ./colors.nix
    ./variables.nix
    ./input.nix
    ./autostart.nix
    ./monitor.nix
    ./windows.nix
  ];
}