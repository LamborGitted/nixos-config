#!/bin/bash
echo "🚀 启动 Neovim 并初始化 Lazy.nvim..."
echo "📦 首次启动会自动安装所有插件，请耐心等待..."
nvim --cmd "lua require('lazy').sync()" $@
