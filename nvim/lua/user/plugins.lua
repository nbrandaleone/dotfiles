-- Plugins.lua
--
-- Based upon Jess Archers course and files: 
-- https://laracasts.com/series/neovim-as-a-php-ide/
-- https://github.com/jessarcher/dotfiles/tree/master/nvim
--
-- Don't forget to PackerSync, PackerCompile, PackerClean

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init({
    compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
--    display = {
--        open_fn = function()
--            return require('packer.util').float({ border = 'solid' })
--        end,
--    },
})

local use = require('packer').use

-- Packer can manage itself
use('wbthomason/packer.nvim')

-- Color Schemes
-- One Dark theme.
-- use({
--     'jessarcher/onedark.nvim',
--     config = function()
--       vim.cmd('colorscheme onedark')
--     end,
--   })

-- My plugins here
-- Commenting support.
-- gc in visual mode, or gcc to comment out a line (takes a count). Motion: gcap to comment a paragraph
use('tpope/vim-commentary')

-- Add, change, and delete surrounding text.
use('tpope/vim-surround')

-- Useful command like :Rename and :SudoWrite.
use('tpope/vim-eunuch')

-- Pairs of handy bracket mappings, like [b and [b.
use('tpope/vim-unimpaired')

-- Indent autodetection with editorconfig support.
use('tpope/vim-sleuth')

-- Allow plugins to enable repeating of commands.
use('tpope/vim-repeat')

-- Add more languages.
use('sheerun/vim-polyglot')

-- Navigate seamlessly between Vim windows and Tmux panes.
use('christoomey/vim-tmux-navigator')

-- Jump to the last location when opening a file.
use('farmergreg/vim-lastplace')

-- Enable * searching with visually selected text.
use('nelstrom/vim-visual-star-search')

-- Automatically create parent dirs when saving.
use('jessarcher/vim-heritage')

-- Text objects for HTML attributes.
use({
    'whatyouhide/vim-textobj-xmlattr',
    requires = 'kana/vim-textobj-user',
  })

-- Automatically set the working directory to the project root.
use({
    'airblade/vim-rooter',
    setup = function()
    -- Instead of this running every time we open a file, we'll just run it once when Vim starts.
    vim.g.rooter_manual_only = 1
  end,
  config = function()
    vim.cmd('Rooter')
  end,
})

-- Automatically add closing brackets, quotes, etc.
use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  })

-- Add smooth scrolling to avoid jarring jumps
use({
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end,
  })

-- All closing buffers without closing the split window.
use({
    'famiu/bufdelete.nvim',
    config = function()
      vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
    end,
  })

-- Split arrays and onto multiple lines, or join them back up.
-- GS, GJ
use({
    'AndrewRadev/splitjoin.vim',
    config = function()
      vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
      vim.g.splitjoin_trailing_comma = 1
      vim.g.splitjoin_php_method_chain_full = 1
    end,
  })

-- Automatically fix indentations when pasting code.
use({
    'sickill/vim-pasta',
    config = function()
      vim.g.pasta_disabled_filetypes = { 'fugitive' }
    end,
  })

-- Telescope fuzzy finder
use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'nvim-telescope/telescope-live-grep-args.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    config = function()
      require('/user/plugins/telescope')
    end,
  })

-- File tree sidebar
use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user/plugins/nvim-tree')
    end,
  })

-- A Status line.
use({
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('lualine').setup()
      --require('user/plugins/lualine')
    end,
  })

-- Display buffers as tabs
-- move using [b and ]b
use({
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    -- after = 'onedark.nvim',
    config = function()
      require('user/plugins/bufferline')
    end,
  })

-- Display indentations lines.
-- use({
--     'lukas-reineke/indent-blankline.nvim',
--     config = function()
--       require('indent_blankline').setup()
--     end,
--   })

-- Add a dashboard.
use {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
    }
  end,
  requires = {'nvim-tree/nvim-web-devicons'}
}

-- Git integration

-- Floating terminal.
use({
  'voldikss/vim-floaterm',
  config = function()
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.keymap.set('n', '<F1>', ':FloatermToggle<CR>')
    vim.keymap.set('t', '<F1>', '<C-\\><C-n>:FloatermToggle<CR>')
  end
})

--------------------------------------------------------------------

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
    require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> 
  augroup end
]])
