return {
  -- Lazy.nvim 自身配置
  {
    "folke/lazy.nvim",
    version = "*",
    lazy = false,
  },

  -- 颜色主题
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = false,
        term_colors = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          which_key = true,
          mason = true,
          lsp_trouble = true,
          markdown = true,
        }
      })
      vim.cmd.colorscheme("catppuccin")
    end
  },

  -- LSP 配置
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      
      -- 通用 LSP 设置
      local on_attach = function(client, bufnr)
        -- 启用格式化
        client.server_capabilities.documentFormattingProvider = true
        
        -- 设置快捷键
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
      end

      -- Nix LSP
      lspconfig.nil_ls.setup{
        on_attach = on_attach,
      }

      -- Lua LSP
      lspconfig.lua_ls.setup{
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = {'vim'} },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          }
        }
      }

      -- Python LSP
      lspconfig.pylsp.setup{
        on_attach = on_attach,
      }

      -- TypeScript/JavaScript LSP
      lspconfig.tsserver.setup{
        on_attach = on_attach,
      }

      -- Rust LSP
      lspconfig.rust_analyzer.setup{
        on_attach = on_attach,
      }
    end
  },

  -- Mason (LSP 管理器)
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  -- Mason LSP 配置
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "nil_ls", "pylsp", "tsserver" }
      })
    end
  },

  -- 自动补全
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        })
      })
    end
  },

  -- 代码片段
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },

  -- 文件树
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
      })
    end
  },

  -- 状态栏
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
        },
      })
    end
  },

  -- 语法高亮
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "python", "rust", "javascript", "typescript", 
          "html", "css", "json", "yaml", "toml", "markdown", 
          "bash", "comment", "regex", "nix"
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },

  -- 模糊查找
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "vertical",
          layout_config = {
            vertical = { width = 0.9, height = 0.9 }
          },
        },
      })
    end
  },

  -- 自动配对括号
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end
  },

  -- 注释插件
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },

  -- Git 集成
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },

  -- 快捷键提示
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end
  },

  -- 缩进线
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = true,
      })
    end
  },
}
