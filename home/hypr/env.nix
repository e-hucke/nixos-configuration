{ ... }:

{
  wayland.windowManager.hyprland.settings.env =
  [
    "ELECTRON_OZONE_PLATFORM_HINT,auto"
    "NIXOS_OZONE_WL,1"
    "QT_CURSOR_SIZE,24"
    "XCURSOR_THEME,BreezeX-RosePineDawn-Linux"
    "XCURSOR_SIZE,24"
    "HYPRCURSOR_THEME,BreezeX-RosePineDawn-Linux"
    "HYPRCURSOR_SIZE,24"
    "LIBVA_DRIVER_NAME,nvidia"
    "__GLX_VENDOR_LIBRARY_NAME,nvidia"
    "__GL_GSYNC_ALLOWED,1"
    "__GL_VRR_ALLOWED,1"
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
  '';
}
