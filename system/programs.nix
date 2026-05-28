{ pkgs, ... }:

{
  programs.uwsm.enable = true;

  programs.hyprland =
  {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  xdg.portal =
  {
    enable = true;
    config.common.default = "*";
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    configPackages = with pkgs; [ xdg-desktop-portal-hyprland xdg-desktop-portal-gtk ];
  };

  programs.gamemode.enable = true;
  programs.thunar.enable = true;

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