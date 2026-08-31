{ pkgs,  ... }:

let
  betterdiscordAsar = pkgs.fetchurl {
    url = "https://github.com/BetterDiscord/BetterDiscord/releases/download/v1.14.1/betterdiscord.asar";
    hash = "sha256-hZX//IqDOfAc34C0o0xkHLls9WdzLFIn9cTGd57f9vY=";
  };
  bdCoreIndexJs = pkgs.writeText "discord_desktop_core-index.js" ''
    try {
      const fs = require("fs");
      const path = require("path");
      const userAsar = path.join(
        process.env.XDG_CONFIG_HOME || path.join(process.env.HOME, ".config"),
        "BetterDiscord", "data", "betterdiscord.asar"
      );
      require(fs.existsSync(userAsar) ? userAsar : "${betterdiscordAsar}");
    } catch (e) {
      console.error("Failed to load BetterDiscord:", e);
    }
    module.exports = require("./core.asar");
  '';
in


{
  programs.discord =
  {
    package = pkgs.discord.overrideAttrs (old: {
      postInstall = (old.postInstall or "") + ''
        install -m644 ${bdCoreIndexJs} $out/opt/Discord/modules/discord_desktop_core/index.js
      '';
    });
    enable = true;
    settings.SKIP_HOST_UPDATE = true;
  };
}