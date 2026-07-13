{ config, pkgs, lib, inputs, ... }:

{
  imports =
  [
    ./hardware-configuration.nix
    ./system
  ];

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri =
  {
    enable = true;
    package = pkgs.niri-unstable;
  };

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
    xwayland-satellite
    nvtopPackages.nvidia
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


  environment.sessionVariables =
  {
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_CURSOR_SIZE = "24";
    XCURSOR_THEME = "BreezeX-RosePineDawn-Linux";
    XCURSOR_SIZE = "24";
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GL_GSYNC_ALLOWED = "1";
    __GL_VRR_ALLOWED = "1";
  };

  system.stateVersion = "25.11";
}
