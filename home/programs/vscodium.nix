{ pkgs, ... }:

{
  programs.vscodium =
  {
    enable = true;
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
    nixfmt
  ];
}
