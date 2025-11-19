{ config, pkgs, username,... }:
let
  user = username; 
in {
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" ];
    shell = pkgs.zsh;
  };
}