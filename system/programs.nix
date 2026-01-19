{ pkgs, ... }:

{
  programs.uwsm.enable = true;

  programs.hyprland = 
  {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  programs.waybar.enable = true;
  programs.gamemode.enable = true;
  programs.thunar.enable = true;

  programs.steam = 
  {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
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