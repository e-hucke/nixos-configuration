{ pkgs, ... }:

let
  bubblewrap = pkgs.bubblewrap.overrideAttrs (old:
  {
    patches = (old.patches or [ ]) ++ [ ./bwrap-allow-caps.patch ];
  });
in
{
  programs.steam.package = pkgs.steam.override
  {
    buildFHSEnv = pkgs.buildFHSEnv.override { inherit bubblewrap; };
    extraBwrapArgs = [ "--cap-add CAP_SYS_NICE" ];

    extraEnv.PRESSURE_VESSEL_BWRAP = "${bubblewrap}/bin/bwrap";
  };
}
