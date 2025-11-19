{config ,pkgs, username , userEmail,...}:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true; 
      
    plugins = with pkgs.vimPlugins; [
  	  lazy-nvim
      nvim-lspconfig
      nvim-tree-lua
      lualine-nvim
      comment-nvim
      nvim-cmp
        
    ];
     
    extraPackages = with pkgs; [
      nil
      lua-language-server
      nodePackages.typescript-language-server
      rust-analyzer
      
      nixpkgs-fmt
      nodePackages.prettier
    ];
    
  };

  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "./neovim/config";
  };
}
