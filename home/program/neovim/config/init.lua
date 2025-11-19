-- 基础设置
vim.opt.number = true           -- 显示行号
vim.opt.relativenumber = true   -- 相对行号
vim.opt.tabstop = 4            -- Tab 宽度
vim.opt.shiftwidth = 4         -- 自动缩进宽度
vim.opt.expandtab = true       -- 将 Tab 转换为空格
vim.opt.smartindent = true     -- 智能缩进
vim.opt.wrap = false           -- 不自动换行
vim.opt.ignorecase = true      -- 搜索忽略大小写
vim.opt.smartcase = true       -- 智能大小写
vim.opt.cursorline = true      -- 高亮当前行
vim.opt.termguicolors = true   -- 真彩色支持
vim.opt.signcolumn = "yes"     -- 总是显示标记列
vim.opt.backup = false         -- 不创建备份文件
vim.opt.writebackup = false
vim.opt.swapfile = false       -- 不创建交换文件
vim.opt.updatetime = 300       -- 更快的补全
vim.opt.timeoutlen = 500       -- 快捷键超时时间

-- 编码设置
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- 设置 leader 键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 加载核心配置
require("core")
