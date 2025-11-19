{config,pkgs,...}:
{
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };


  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.gnome-themes-extra;
    size = 24;
  };
}