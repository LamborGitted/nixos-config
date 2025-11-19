local keymap = vim.keymap

-- 常用快捷键
keymap.set("n", "<leader>sv", "<cmd>source $MYVIMRC<cr>") -- 重载配置
keymap.set("n", "<leader>qq", "<cmd>qa<cr>") -- 退出所有窗口

-- 窗口管理
keymap.set("n", "<C-h>", "<C-w>h") -- 切换到左侧窗口
keymap.set("n", "<C-j>", "<C-w>j") -- 切换到下方窗口
keymap.set("n", "<C-k>", "<C-w>k") -- 切换到上方窗口
keymap.set("n", "<C-l>", "<C-w>l") -- 切换到右侧窗口

-- 标签页管理
keymap.set("n", "<leader>to", "<cmd>tabnew<cr>") -- 新建标签页
keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>") -- 关闭标签页
keymap.set("n", "<leader>tn", "<cmd>tabn<cr>") -- 下一个标签页
keymap.set("n", "<leader>tp", "<cmd>tabp<cr>") -- 上一个标签页

-- 文件树
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- 模糊查找
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- LSP 快捷键
keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>")
keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")

-- 调试快捷键
keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>")
keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>")

-- 移动选中的行
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
