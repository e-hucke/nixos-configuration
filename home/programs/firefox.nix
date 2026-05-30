{ pkgs, config, ... }:

{
  programs.firefox =
  {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    profiles.default =
    {
      isDefault = true;
      settings =
      {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      userChrome =
      ''
        .titlebar-buttonbox-container {
          display: none !important;
        } 
        .titlebar-spacer[type="post-tabs"] {
          display: none !important;
        }
      '';
    };
  };
}