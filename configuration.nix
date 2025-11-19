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
  system.stateVersion = "23.11";
  nixpkgs.config.allowUnfree = true;


  # i18n.ibus
  i18n.inputMethod = {
    enabled = "ibus"; 
    ibus.engines = with pkgs.ibus-engines; [
      libpinyin  
      rime       
      table      
      table-chinese  
    ];
  };
  environment.variables = {
    GTK_IM_MODULE = "ibus";
    QT_IM_MODULE = "ibus";
    XMODIFIERS = "@im=ibus";
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