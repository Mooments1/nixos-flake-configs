
{ config, lib, pkgs, ... }:

{
  imports =
    [
    ./hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiInstallAsRemovable = true;
  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

 time.timeZone = "Europe/Berlin";

  services.displayManager.ly.enable = true;
  services.xserver.windowManager.dwm.enable = true;
  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs (old: {
  	src = ./ps/dwm;
	patches = [
	];
});
    # steam
    programs.steam = {
        enable = true;
};


    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-unwrapped"
];

# die Ende von Steam

  # xserver
  services.xserver.enable = true;

  # graphik
  hardware.graphics = {
	enable = true;
	extraPackages = with pkgs; [
		intel-media-driver
		intel-vaapi-driver
		vulkan-loader
		vulkan-validation-layers
		libvdpau-va-gl
		];
};
nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.xserver.xkb = {
    layout = "us,ru,de";
    variant = "";
    options = "grp:caps_toggle";
  };

services.libinput.enable = true;
  users.users.mooments1 = {
     isNormalUser = true;
     extraGroups = [ "wheel" "video" "audio" "input" "render" ]; 
     packages = with pkgs; [
       tree
     ];
   };
  # firefox
  programs.firefox.enable = true;
  
  zramSwap = {
  enable = true;
  priority = 100;
};
  #Thunar
  programs.thunar.enable = true;
  programs.xfconf.enable = true;

  services.gvfs.enable = true; 
  services.tumbler.enable = true; 

  environment.systemPackages = with pkgs; [

     # prismlauncher
     libigl
     libGL

     # home
     home-manager
     dconf
     mesa-demos
     mpvpaper
     mpv
     protontricks
     # gamescope
     gamescope
     gamescope-wsi

     # Datei
     #
     gimp
     flameshot
     fastfetch
     vesktop
     btop
     nwg-look
     gtk3
     gtk4
     qview
     wleave
     anki-bin
     unzip
     unrar-wrapper
     xclip
     # musik
     pear-desktop

     # telegram
     telegram-desktop

     # pipewire
     wiremix

     # die Bilder als Wallpaper zu stellen.
     feh
     waypaper
     
     # tools
     gnumake

     # thunar
     thunar-archive-plugin
     thunar-volman
     # vim
     neovim

     # dwm
     dmenu
     alacritty

     # xorg
     xinit
     xprop
     xf86inputlibinput

     # git  
     wget
     git

     # Intel
     libva
     libva-utils
     intel-gpu-tools
     intel-llvm
     microcode-intel
     libvpl
     openpgl
     vpl-gpu-rt
     intel-compute-runtime-legacy1 
  ];

   fonts.packages = with pkgs; [
   	nerd-fonts.jetbrains-mono

   ];


  system.stateVersion = "26.05";

}

