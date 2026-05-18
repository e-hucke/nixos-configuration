{ pkgs, ...}:

{
  imports =
  [
    ./services.nix
    ./programs
    ./hypr
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
