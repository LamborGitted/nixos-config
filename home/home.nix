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
  ];



  home.packages = with pkgs; [
    kitty
    fuzzel
    clash-verge-rev
    bat
    firefox
  ];
}