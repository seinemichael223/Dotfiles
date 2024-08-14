-- FNC nvim Config
-- Created: 1st October 2023

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

require('lazy').setup({
  {
      'catppuccin/nvim',
      name = 'catppuccin',
      priority = 100
  },
  -- LSP Support
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
    }
  },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {'L3MON4D3/LuaSnip', build = "make install_jsregexp"}
    },
  },
  {'nvim-lualine/lualine.nvim',
  dependecies = {
    {'nvim-tree/nvim-web-devicons'}
  }
  },
  -- init.lua:
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
    opts = {
        defaults = {
            vimgrep_arguments = {
                "rg",
                "--vimgrep",
                "--hidden",
                "--follow",
            },
        },
    },
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-treesitter/nvim-treesitter'
    },
    {
        'preservim/nerdtree'
    },
    {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
    },
    {
    'norcalli/nvim-colorizer.lua'
    }
})

vim.opt.termguicolors = true
require 'colorizer'.setup()

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)


lsp_zero.setup_servers({'cmake', 'clangd', 'jedi_language_server', 'java_language_server', 'tsserver', 'rust_analyzer', 'lua_ls'})

-- LSP Keybinds
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

  })
})

-- lualine Configuration
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = "catppuccin",
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Treessitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "cpp", "python", "rust", "java", "javascript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,


  },
}

-- General Settings
vim.cmd.colorscheme('catppuccin-frappe')

vim.opt.encoding = "utf-8"

vim.opt.nu = true
vim.opt.mouse = "a"
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.g.mapleader = " "

-- Replace all instances of a keyword
vim.keymap.set("n", "S", ":%s//gI<Left><Left><Left>")
vim.opt.wildmode = "longest,list,full"

-- Telescope Keybinds
local builtin = require('telescope.builtin')
local telescopeConfig = require("telescope.config")
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

-- I want to follow symbolic links
table.insert(vimgrep_arguments, "-L")


vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fc', builtin.live_grep, {})

-- Nerdtree Keybinds
vim.keymap.set('n', '<leader>n', ':NERDTreeToggle<CR>')
vim.o.scrolloff = 4



