{ config, lib, pkgs, ... }:

let
  # Valve's script from SteamOS (1.3-3) with a working interpreter and PATH
  firmwareToggles = pkgs.stdenvNoCC.mkDerivation
  {
    pname = "holo-realtek-firmware-toggles";
    version = "1.3-3";

    src = ./holo-realtek-firmware-toggles;
    unpackPhase = "cp $src holo-realtek-firmware-toggles";
    patches = [ ./mcs-rates-only-when-associated.patch ];

    buildInputs = [ pkgs.bash ];

    installPhase =
    ''
      runHook preInstall

      install -Dm755 holo-realtek-firmware-toggles $out/bin/holo-realtek-firmware-toggles
      sed -i '1a export PATH=${lib.makeBinPath (with pkgs; [ coreutils findutils gnugrep iw ])}:/run/wrappers/bin' $out/bin/holo-realtek-firmware-toggles

      runHook postInstall
    '';
  };

  lowLatencyShim = pkgs.writeTextFile
  {
    name = "holo-realtek-firmware-toggles-shim";
    destination = "/bin/holo-polkit-helpers/holo-realtek-firmware-toggles";
    executable = true;
    text =
    ''
      #!/bin/sh
      unset LD_LIBRARY_PATH LD_PRELOAD
      case "$1 $2" in
        "set-low-latency-mode on") mode=on ;;
        "set-low-latency-mode off") mode=off ;;
        *) echo "$0: unsupported: $*" >&2; exit 2 ;;
      esac
      SYSTEMD_OFFLINE=0 systemctl --no-ask-password start "steam-frame-low-latency@$mode.service"
      exit 0
    '';
  };

  capSysNiceShim = pkgs.writeTextFile
  {
    name = "holo-grant-cap-sys-nice-shim";
    destination = "/bin/holo-polkit-helpers/holo-grant-cap-sys-nice";
    executable = true;
    text =
    ''
      #!/bin/sh
      unset LD_LIBRARY_PATH LD_PRELOAD
      exec /run/current-system/sw/bin/unshare --user --map-root-user setcap cap_sys_nice=eip "$1"
    '';
  };
in
{
  security.rtkit.enable = true;

  boot.extraModulePackages = [ (config.boot.kernelPackages.callPackage ./rtw89-debugfs.nix { }) ];

  systemd.services."steam-frame-low-latency@" =
  {
    description = "Steam Frame wireless adapter low-latency mode (%i)";
    unitConfig.ConditionPathExistsGlob = "/sys/kernel/debug/ieee80211/*/rtw89";
    startLimitIntervalSec = 0;
    serviceConfig =
    {
      Type = "oneshot";
      TimeoutStartSec = 15;
      ExecStart = "${firmwareToggles}/bin/holo-realtek-firmware-toggles set-low-latency-mode %i";
    };
  };

  security.polkit.extraConfig =
  ''
    polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.systemd1.manage-units" &&
          action.lookup("verb") == "start" &&
          /^steam-frame-low-latency@(on|off)\.service$/.test(action.lookup("unit")) &&
          subject.isInGroup("networkmanager")) {
        return polkit.Result.YES;
      }
    });
  '';

  programs.steam.extraPackages = [ lowLatencyShim capSysNiceShim ];
  environment.systemPackages = [ firmwareToggles ];
}
