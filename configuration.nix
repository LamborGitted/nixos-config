{ config, pkgs,username,userEmail, ... }: {

  imports = [ 
    ./program.nix
    ./user.nix
    ./hardware-configuration.nix
  ];

  #home
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit username userEmail;
    };
    users.${username} = {
      imports = [ ./home/home.nix ];
    };
    
  };

  # boot-loader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  

  # system
  system.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;


  # i18n.ibus
  # i18n.inputMethod = {
  #   enabled = "ibus"; 
  #   ibus.engines = with pkgs.ibus-engines; [
  #     libpinyin  
  #     rime       
  #     table      
  #     table-chinese  
  #   ];
  # };
  # i18n.supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
  # environment.variables = {
  #   GTK_IM_MODULE = "ibus";
  #   QT_IM_MODULE = "ibus";
  #   XMODIFIERS = "@im=ibus";
  #   SDL_IM_MODULE = "ibus";
  #   CLUTTER_IM_MODULE = "ibus";
  #   GLFW_IM_MODULE = "ibus";
  # };

  #i18n.fcitx5
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      qt6Packages.fcitx5-chinese-addons 
      fcitx5-nord 
      fcitx5-rime           
    ];
  };
  environment.variables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    CLUTTER_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "fcitx";
  };


  # network
  networking.hostName = "nixos";

  # time & area
  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "zh_CN.UTF-8";


  #nix
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings.substituters=[
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
    settings={
       max-jobs = "auto";     
      cores = 0;         
      auto-optimise-store = true;
    };

  };

}