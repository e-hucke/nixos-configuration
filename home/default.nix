{ inputs, pkgs, ...}:

{
  imports =
  [
    ./programs
    inputs.noctalia.homeModules.default
    inputs.niri.homeModules.niri
  ];

  home.packages = with pkgs;
  [
    bolt-launcher
    deluge
    wl-clipboard
    git
    pavucontrol
    grim
    slurp
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
    obs-studio
  ];

  home.pointerCursor =
  {
    enable = true;
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RosePineDawn-Linux";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
    hyprcursor.enable = true;
  };

  programs.niri.config = builtins.readFile ./niri.kdl;

  home.file.".local/share/scripts/niri-monitor-menu.sh" =
  {
    source = ./assets/scripts/niri-monitor-menu.sh;
    executable = true;
  };

  home.stateVersion = "25.11";
}
