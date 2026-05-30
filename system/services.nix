{ pkgs, ... }:

{
  services.gvfs.enable = true;
  services.getty.helpLine = "";
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
}