{ ... }:

{
  wayland.windowManager.hyprland =
  {
    enable = true;
    package = null;
    systemd.enable = false;
  };
  imports =
  [
    ./colors.nix
    ./variables.nix
    ./input.nix
    ./autostart.nix
    ./monitor.nix
    ./windows.nix
    ./env.nix
  ];
}