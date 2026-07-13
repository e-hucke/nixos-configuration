{ pkgs,  ... }:

{
  imports =
  [
    ./fish.nix
    ./kitty.nix
    ./fastfetch.nix
    ./vscodium.nix
    ./firefox.nix
  ];

  programs.vesktop =
  {
    enable = true;
    package =
      let
        electron = pkgs.electron_41;
      in
      (pkgs.vesktop.override { electron_40 = electron; }).overrideAttrs (old: {
        preBuild = ''
          jq '.devDependencies.electron = "${electron.version}"' package.json > package.json.tmp
          mv package.json.tmp package.json
        '' + old.preBuild;
      });
  };
  programs.lutris.enable = true;
  programs.noctalia.enable = true;
  programs.mangohud =
  {
    enable = true;
    enableSessionWide = true;
  };
}