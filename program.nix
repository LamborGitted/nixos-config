{config , pkgs , ...}:

{
  #program 
  programs.zsh={
    enable=true;
  };

  programs.neovim={

  };

  programs.hyprland={
    enable=true;
    xwayland.enable=true;
  };



  #networking
  networking.networkmanager={
    enable = true;
  };



  #service
  services.openssh={
    enable=true;
    ports=[22];
    openFirewall=true;
    settings.PasswordAuthentication=true;
  };

  services.displayManager={
    sddm.enable=true;
    defaultSession="hyprland";
  };

  services.xserver={
    enable=true;
    layout="cn";
  };

  services.blueman={
    enable=true;
  };

  services.printing={
    enable=true;
  };


}