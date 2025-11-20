{config,pkgs,...}:
let 
  theme = "shorin@waybar";

  themeDir = builtins.toPath ./home/program/waybar/${theme}/;
    
in {

  xdg.configFile."waybar".source = themeDir;

  home.packages = with pkgs;[
    waybar
  ];
}