{ config, pkgs, self,... }:

{
  xdg.configFile."waypaper/config.ini".text = ''
    [Settings]
    backend = swww
    wallpaper_directory = ${self}/Pictures/Wallpapers
    fill = fill
    random_wallpaper = true
    swww_transition_type = any
    swww_transition_step = 50
    swww_transition_duration = 3
  '';

  systemd.user.services.swww = {
    Unit = {
      Description = "swww daemon";
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.swww}/bin/swww-daemon";
      Restart = "always";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };


  home.packages = with pkgs;[
    waypaper
    swww
  ];
}
