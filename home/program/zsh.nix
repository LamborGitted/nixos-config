{config,pkgs,...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "fzf" "docker" ];
      theme = "agnoster";
    };
    
    initExtra = ''
      # 设置别名
      alias ls='eza --icons'
      alias ll='eza -al --icons'
      alias cat='bat'
      
      # 中文环境
      export LANG=zh_CN.UTF-8
      export LC_ALL=zh_CN.UTF-8
      
      # Wayland 环境变量
      export QT_QPA_PLATFORM=wayland
      export SDL_VIDEODRIVER=wayland
      export XDG_SESSION_TYPE=wayland
      export MOZ_ENABLE_WAYLAND=1
      
    '';
    
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/neoFlake";
      ncg = "cd ~/neoFlake && nix flake update";
      hms = "home-manager switch --flake ~/neoFlake";
    };
  };

  home.packages = with pkgs;[
    fzf
  ];
}