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

return require("lazy").setup({
  {
    'folke/which-key.nvim',
    opts = {},
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("user.which-key").setup()
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require("user.nvim-tree").setup()
    end,
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    event = "User DirOpened",
  },
  -- Colorscheme
  "lunarvim/darkplus.nvim",
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("user.lualine").setup()
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },
      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
      -- A plugin to configure Neovim LSP using json/yaml files like coc-settings.json.
      "nlsp-settings.nvim"
    },
  },
  { "tamago324/nlsp-settings.nvim", cmd = "LspSettings", lazy = true },
  { "jose-elias-alvarez/null-ls.nvim", lazy = true },
  {
    "williamboman/mason.nvim",
    -- config = function()
    --   require("user.mason").setup()
    -- end,
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    lazy = true,
  },
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    config = function()
      require("user.nvim-cmp").setup()
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    -- opts = {
    --   -- See `:help gitsigns.txt`
    --   signs = {
    --     add = { text = '+' },
    --     change = { text = '~' },
    --     delete = { text = '_' },
    --     topdelete = { text = '‾' },
    --     changedelete = { text = '~' },
    --   },
    -- },
    config = function ()
      require("user.gitsigns").setup()
    end,
    -- event = "User FileOpened",
    -- cmd = "Gitsigns",
  },
  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', version = '*', lazy = true,
    cmd = "Telescope",
    dependencies = { 'nvim-lua/plenary.nvim', 'telescope-fzf-native.nvim' },
    config = function()
      require("user.telescope").setup()
    end,
    keys = {
      { '<leader>?', "<CMD>:lua require'telescope.builtin'.oldfiles{}<CR>", desc = '[?] Find recently opened files' }
    }
  },
  { "nvim-telescope/telescope-fzf-native.nvim",
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
    lazy = true,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
      require("user.nvim-treesitter").setup()
    end,
  },
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      -- char = '┊',
      show_trailing_blankline_indent = false,
    },
  },
  {
    -- Lazy loaded by Comment.nvim pre_hook
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
  },
  -- Comments
  {
    "numToStr/Comment.nvim",
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    event = "User FileOpened",
    config = function()
      require("user.comment").setup()
    end
  },
  -- alpha
  {
    "goolord/alpha-nvim",
    config = function()
      require("user.alpha").setup()
    end,
    event = "VimEnter",
  },
  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("user.autopairs").setup()
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" }
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function ()
      require("nvim-ts-autotag").setup()
    end
  },
  { 'akinsho/bufferline.nvim',
    version = "v3.*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
      require("user.bufferline").setup()
    end
  },
  -- Icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
})
