{ ... }:

{
  wayland.windowManager.hyprland.settings.env =
  [
    { _args = [ "ELECTRON_OZONE_PLATFORM_HINT" "auto" ]; }
    { _args = [ "NIXOS_OZONE_WL" "1" ]; }
    { _args = [ "QT_CURSOR_SIZE" "24" ]; }
    { _args = [ "XCURSOR_THEME" "BreezeX-RosePineDawn-Linux" ]; }
    { _args = [ "XCURSOR_SIZE" "24" ]; }
    { _args = [ "HYPRCURSOR_THEME" "BreezeX-RosePineDawn-Linux" ]; }
    { _args = [ "HYPRCURSOR_SIZE" "24" ]; }
    { _args = [ "LIBVA_DRIVER_NAME" "nvidia" ]; }
    { _args = [ "__GLX_VENDOR_LIBRARY_NAME" "nvidia" ]; }
    { _args = [ "__GL_GSYNC_ALLOWED" "1" ]; }
    { _args = [ "__GL_VRR_ALLOWED" "1" ]; }
    { _args = [ " QT_QPA_PLATFORMTHEME" "qt6ct" ]; }
  ];

  xdg.configFile."uwsm/env-hyprland".text =
  ''
    export ELECTRON_OZONE_PLATFORM_HINT=auto
    export NIXOS_OZONE_WL=1
    export QT_CURSOR_SIZE=24
    export XCURSOR_THEME=BreezeX-RosePineDawn-Linux
    export XCURSOR_SIZE=24
    export HYPRCURSOR_THEME=BreezeX-RosePineDawn-Linux
    export HYPRCURSOR_SIZE=24
    export LIBVA_DRIVER_NAME=nvidia
    export GBM_BACKEND=nvidia-drm
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __GL_GSYNC_ALLOWED=1
    export __GL_VRR_ALLOWED=1
    export QT_QPA_PLATFORMTHEME=qt6ct
  '';
}
