{ ... }:

{
  imports =
  [
    ./fish.nix
    ./kitty.nix
    ./btop.nix
    ./fastfetch.nix
    ./vscodium.nix
    ./firefox.nix
  ];

  programs.vesktop.enable = true;
  programs.lutris.enable = true;
  programs.noctalia.enable = true;
  programs.mangohud =
  {
    enable = true;
    enableSessionWide = true;
  };
}