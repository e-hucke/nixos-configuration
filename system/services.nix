{ pkgs, ... }:

{
  services.pipewire =
  {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    wireplumber.enable = true;
    pulse.enable = true;
    extraConfig.pipewire-pulse.pulse.cmd =
    [
      {
        cmd = "load-module";
        args = "module-combine-sink";
      }
    ];
  };
  security.pam.services.hyprlock = {};
  services.mullvad-vpn =
  { 
    enable = true;
    package = pkgs.mullvad-vpn;
  };
  virtualisation.docker =
  {
    enable = true;
    storageDriver = "btrfs";
  };
  services.displayManager.ly =
  {
    enable = true;
    settings =
    {
      brightness_down_key = null;
      brightness_up_key = null;
      animation = "colormix";
      colormix_col1 = "0xC49EB8";
      colormix_col2 = "0xE8B4D4";
      colormix_col3 = "0xC97082";
    };
  };
}
