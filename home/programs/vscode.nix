{ pkgs, ... }:

{
  programs.vscode =
  {
    enable = true;
    package = pkgs.vscodium;
    profiles.default =
    {
      extensions = with pkgs.vscode-extensions;
      [
        jnoortheen.nix-ide
      ];
      userSettings =
      {
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.serverSettings" =
        {
          nixd =
          {
            formatting.command = [ "nixfmt" ];
          };
        };
      };
    };
  };

  home.packages = with pkgs;
  [
    nixd
    nixfmt-rfc-style
  ];
}
