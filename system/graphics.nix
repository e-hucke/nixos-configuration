{ pkgs, ... }:

{
  hardware.graphics.enable = true;
  hardware.nvidia =
  {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    powerManagement.enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  boot.kernelParams =
  [
    "nvidia-drm.fbdev=1"
    "video=DP-3:d"
  ];

  services.udev.extraRules =
  ''
    SUBSYSTEM=="drm", KERNEL=="card1-DP-3", RUN +="${pkgs.coreutils}/bin/chmod 666 /sys/class/drm/card1-DP-3/status"
  '';

  environment.etc."nvidia/nvidia-application-profiles-rc.d/50-limit-free-buffer-pool-in-wayland-compositors.json".text =
  ''
    {
        "rules": [
            {
                "pattern": {
                    "feature": "procname",
                    "matches": "niri"
                },
                "profile": "Limit Free Buffer Pool On Wayland Compositors"
            }
        ],
        "profiles": [
            {
                "name": "Limit Free Buffer Pool On Wayland Compositors",
                "settings": [
                    {
                        "key": "GLVidHeapReuseRatio",
                        "value": 0
                    }
                ]
            }
        ]
    }
  '';
}