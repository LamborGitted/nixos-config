{config ,pkgs, username , lib,userEmail,...}:
{
  programs.git = {
    enable = true;
    userName = username;
    userEmail = userEmail;
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}