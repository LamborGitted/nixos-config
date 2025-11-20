{config , pkgs,...}:
{
  programs.kitty={
    enable=true;

    settings={
      background_opacity = "0.9";
      dynamic_background_opacity = "yes";
      background_blur = 5;   
    };
  };

  home.packages = with pkgs;[
    kitty
  ]

}