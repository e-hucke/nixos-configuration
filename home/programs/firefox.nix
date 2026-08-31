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
        "browser.tabs.closeWindowWithLastTab" = false;
        "widget.non-native-theme.gtk.scrollbar.thumb-size" = 1;
        "widget.non-native-theme.scrollbar.style" = 4;
        "widget.non-native-theme.scrollbar.size.override" = 10;
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