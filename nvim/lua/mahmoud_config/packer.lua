-- require("mahmoud_config.remap")
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  --   Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'yamatsum/nvim-cursorline'
  use 'brenoprata10/nvim-highlight-colors'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use ({'Mofiqul/dracula.nvim', as = 'dracula'})
  vim.cmd('colorscheme dracula')

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use ({
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  })
  -- Lsp 0
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
    {'hrsh7th/cmp-path'},
    {'mtoohey31/cmp-fish'},
  }
}

end)
