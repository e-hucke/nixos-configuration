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
  ];


  home.stateVersion = "25.11";
}
