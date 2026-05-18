{ config, pkgs, lib, ... }:

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz;
in

{
  imports = 
  [ 
    ./hardware-configuration.nix
    (import "${home-manager}/nixos")
    ./system
  ];

  
  boot = 
  {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };
  zramSwap.enable = true;


  fileSystems."/mnt/shared" = 
  {
    device = "/dev/nvme0n1p3";
    fsType = "btrfs";
  };


  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb.layout = "us";


  networking.hostName = "nixos";
  networking.networkmanager.enable = true;


  users.users.e = 
  {
    isNormalUser = true;
    description = "e";
    extraGroups = [ "networkmanager" "wheel" ];
  };


  home-manager = 
  {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.e = import ./home;
  };


  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; 
  [
    ntfs3g
    psmisc
    networkmanagerapplet
    rose-pine-cursor
    pulseaudio
  ];
  
  fonts.packages = with pkgs; 
  [
    fira
    dejavu_fonts
    nerd-fonts.symbols-only
  ];
 

  environment.variables = 
  {
    "SUDO_EDITOR" = "nvim";
    "XCURSOR_THEME" = "BreezeX-RosePineDawn-Linux";
    "XCURSOR_SIZE" = 24;
  };


  system.stateVersion = "25.11";
}
