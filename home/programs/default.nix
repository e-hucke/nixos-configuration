{ ... }:

{
  imports =
  [
    ./fish.nix
    ./kitty.nix
    ./btop.nix
    ./fuzzel.nix
    ./cliphist.nix
    ./wlogout.nix
    ./fastfetch.nix
  ];

  programs.vesktop.enable = true;
  programs.firefox.enable = true;
  programs.lutris.enable = true;
  programs.mangohud =
  {
    enable = true;
    enableSessionWide = true;
  };
}