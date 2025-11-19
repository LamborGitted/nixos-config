-- 显示选项
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.showmode = false

-- 缩进选项
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- 搜索选项
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- 性能选项
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.lazyredraw = true

-- 文件选项
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true

-- 界面选项
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.cmdheight = 1

-- 其他选项
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menu,menuone,noselect"
