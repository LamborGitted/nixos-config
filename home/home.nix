{ config, pkgs, inputs, user, username , userEmail,... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.05";

  imports = [
    ./program/git.nix
    ./program/gtk.nix
    ./program/hyprland.nix
    ./program/neovim.nix
    ./program/vscode.nix
    ./program/waybar.nix
    ./program/zsh.nix
    ./program/kitty.nix  
  ];


  home.packages = with pkgs; [
    fuzzel
    clash-verge-rev
    firefox
    qq
    obs-studio
    spotify
  ];
}