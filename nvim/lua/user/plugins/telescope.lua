-- Fuzzy Finder

local actions = require('telescope.actions')

vim.cmd([[
  highlight link TelescopePromptTitle PMenuSel
  highlight link TelescopePreviewTitle PMenuSel
  highlight link TelescopePromptNormal NormalFloat
  highlight link TelescopePromptBorder FloatBorder
  highlight link TelescopeNormal CursorLine
  highlight link TelescopeBorder CursorLineBg
  ]])

require('telescope').setup({
    defaults = {
      dynamic_preview_title = true,
      path_display = { truncate = 1 },
      prompt_prefix = '   ',
      selection_caret = ' ',
      layout_config = {
        prompt_position = 'top',
      },
      sorting_strategy = 'ascending',
      mappings = {
        i = {
          ['<esc>'] = actions.close,
          ['<C-Down>'] = actions.cycle_history_next,
          ['<C-Up>'] = actions.cycle_history_prev,
        },
      },
      file_ignore_patterns = { '.git/' },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
      buffers = {
        previewer = false,
        layout_config = {
          width = 80,
        },
      },
      oldfiles = {
        prompt_title = 'History',
      },
      lsp_references = {
        previewer = false,
      },
    },
  })

require('telescope').load_extension('fzf')
require('telescope').load_extension('live_grep_args')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>F', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All files' })<CR>]])
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>g', [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
vim.keymap.set('n', '<leader>b',  builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>h',  builtin.oldfiles, {})
vim.keymap.set('n', '<leader>s',  builtin.lsp_document_symbols, {})

