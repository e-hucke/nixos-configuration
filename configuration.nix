{ config, pkgs, lib, inputs, ... }:

{
  imports =
  [
    ./hardware-configuration.nix
    ./system
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
  hardware.i2c.enable = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;


  users.users.e = 
  {
    isNormalUser = true;
    description = "e";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };


  home-manager = 
  {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
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
    rar
    unar
    wine
    kdePackages.dolphin
    kdePackages.qtsvg
    kdePackages.ffmpegthumbs
    kdePackages.kdegraphics-thumbnailers
    kdePackages.qtimageformats
    kdePackages.kimageformats
    kdePackages.kio-admin
    kdePackages.kompare
    taglib
    icoutils
    gpu-screen-recorder-gtk
    ddcutil
    nwg-look
    adw-gtk3
    qt6Packages.qt6ct
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
  };

  system.stateVersion = "25.11";
}
