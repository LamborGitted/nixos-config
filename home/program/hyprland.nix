{config,pkgs,...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {

      monitor = ",preferred,auto,1";
      
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad ={
          natural_scroll=true; 
          scroll_factor=1.0;
          tap-to-click=true;
          disable_while_typing=true;
        };
      };
      
      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };
      
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        #drop_shadow = true;
        #shadow_range = 4;
        #shadow_render_power = 3;
        #"col.shadow" = "rgba(1a1a1aee)";
      };
      
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      
      windowrule = [
        #"float, ^(kitty)$"
        #"float, ^(file-roller)$"
        "float , class:^(waypaper)$"
      ];
      
      exec-once = [
        "ibus-daemon -drx"
        "fcitx5 -r --enable fcitx5-rime"
        "waybar &"
        "swww-daemon"
        "waypaper --restore"
      ];

      bind = [
        "SUPER, T, exec, kitty"
        "SUPER, Q, killactive"
        "SUPER, M, exit"
        "SUPER, E, exec, nautilus"
        "SUPER, F, exec, firefox"
        "SUPER, V, togglefloating"
	      "SUPER, D, exec, fuzzel"
        "SUPER, I, exec, code"
        "SUPER, P, pseudo"
        "SUPER, J, togglesplit"
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"  

      ];
      
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];
    };
  };
}