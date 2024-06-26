vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wildmode = 'longest:full,full' -- complete the longest common match, and allow tabbing the results to fully complete them

vim.opt.title = true
vim.opt.mouse = 'a'   -- enable mouse for all modes

vim.opt.termguicolors = true

vim.opt.spell = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

--vim.opt.list = true  -- enable the below listchars
vim.opt.listchars = { tab = '▸ ', trail = '·', nbsp = '␣' }
vim.opt.fillchars:append({ eob = ' ' }) -- remove the ~ from the end of buffer

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4

--vim.opt.clipboard = 'unnamedplus' -- Use system clipboard

vim.opt.confirm = true -- ask for confirmation instead if erroring
vim.opt.undofile = true  -- persistent undo
vim.opt.backup = true    -- automatically save a backup file
vim.opt.backupdir:remove('.')  -- keep backups out of current directory
