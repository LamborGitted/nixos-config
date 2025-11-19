{config,pkgs,...}:
{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 35;
      spacing = 4;
    };
  
    
    style = ''
      
    '';
  };
}