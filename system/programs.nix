{ pkgs, ... }:

{
  xdg.portal =
  {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gnome xdg-desktop-portal-gtk kdePackages.xdg-desktop-portal-kde ];

    config =
    {
      common.default = [ "gnome" "gtk" ];
      niri."org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
    };
  };

  programs.gamemode.enable = true;
  programs.gpu-screen-recorder.enable = true;
  environment.etc."xdg/menus/applications.menu".source = "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  programs.steam = 
  {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
    protontricks.enable = true;
  };

  programs.neovim =
  {
    enable = true;
    configure =
    {
      customLuaRC =
      ''
        vim.opt.number = true
        vim.opt.clipboard = "unnamedplus"
        vim.o.tabstop = 2
        vim.o.shiftwidth = 2
        vim.o.expandtab = true
      '';
    };
  };
}