-- lualine.lua

require('lualine').setup({
    options = {
      section_separator = '',
      component_separator = '',
      globalstatus = true,
      theme = {
        normal = {
          a = 'StatusLine',
          b = 'StatusLine',
          c = 'StatusLine',
        },
      },
    },
    sections = {
      lualine_a = {
        'mode',
      },
      lualine_b = {
        'branch',
        {
          'diff',
          symbols = { added = ' ', modified = ' ', removed = ' ' },
        },
        'diff',
--        '󰅭 ' .. vim.pesc(tostring(#vim.tbl_keys(vim.lsp.buf_get_clients())) or ''),
--        { 'diagnostics', sources = { 'nvim_diagnotic' } },
      },
      lualine_c = {
        'filename'
      },
      lualine_x = {
          -- require("lazy.status").updates,
          -- cond = require("lazy.status").has_updates,
          -- color = { fg = "#ff9e64" },
        'filetype',
        'encoding',
        'fileformat',
      },
      lualine_y = {
        'filetype',
        'encoding',
        'fileformat',
        '(vim.bo.expandtab and "␠ " or "⇥ ") .. vim.bo.shiftwidth',
      },
      lualine_z = {
        'searchcount',
        'selectioncount',
        'location',
        'progress',
      },
    },
})
