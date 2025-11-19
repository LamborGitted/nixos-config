-- 加载核心模块
require("core.keymaps")
require("core.options")

-- 设置 Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 加载插件
require("lazy").setup("plugins")

-- 自动命令
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- 文件类型特定设置
vim.api.nvim_create_autocmd("FileType", {
  pattern = "nix",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
  end,
})

-- 启动提示
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    print("🎉 Neovim Lazy 配置加载成功!")
  end,
})
