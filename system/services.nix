{ ... }:

{
  services.gvfs.enable = true;
  services.pipewire =
  {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    wireplumber.enable = true;
    pulse =
    {
      enable = true;
      extraConfig =
      ''
        load-module module-combine-sink
      '';
    };
  };
  security.pam.services.hyprlock = {};
}