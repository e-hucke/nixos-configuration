{ pkgs,  ... }:

{
  imports =
  [
    ./fish.nix
    ./kitty.nix
    ./fastfetch.nix
    ./vscodium.nix
    ./firefox.nix
    ./discord.nix
  ];

  programs.lutris.enable = true;
  programs.noctalia.enable = true;
  programs.mangohud =
  {
    enable = true;
    enableSessionWide = true;
  };
}