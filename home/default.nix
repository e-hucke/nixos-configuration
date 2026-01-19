{ pkgs, ...}:

{
  imports =
  [
    ./services
    ./programs
  ];

  home.packages = with pkgs;
  [
    fastfetch
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
  ];

  programs.vesktop.enable = true;
  programs.firefox.enable = true;
  programs.lutris.enable = true;
  programs.mangohud =
  {
    enable = true;
    enableSessionWide = true;
  };
  programs.vscode =
  {
    enable = true;
    package = pkgs.vscodium;
  };


  home.stateVersion = "25.11";
}
