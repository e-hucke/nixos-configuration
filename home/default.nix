{ pkgs, ...}:

{
  imports =
  [
    ./services.nix
    ./programs
    ./hypr
    ./waybar
  ];

  home.packages = with pkgs;
  [
    bolt-launcher
    deluge
    wl-clipboard
    git
    pavucontrol
    grim
    papirus-icon-theme
    protonup-qt
    kdePackages.ark
    hyprpaper
    hypridle
    hyprlock
    filezilla
    qimgv
    gimp
    mpv
    jq
    pamixer
  ];

  home.pointerCursor =
  {
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RosePineDawn-Linux";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
    hyprcursor.enable = true;
  };

  home.stateVersion = "25.11";
}
