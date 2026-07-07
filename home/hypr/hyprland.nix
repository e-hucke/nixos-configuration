{ pkgs, ... }:

{
  wayland.windowManager.hyprland =
  {
    enable = true;
    package = null;
    systemd.enable = false;
    configType = "lua";
    plugins = [ pkgs.hyprlandPlugins.hypr-dynamic-cursors ];
  };
  imports =
  [
    ./variables.nix
    ./input.nix
    ./autostart.nix
    ./monitor.nix
    ./rules.nix
    ./env.nix
  ];
}
