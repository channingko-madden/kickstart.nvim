-- [[ Configure language specific stuff
-- The below requires neovim 0.7.0!
-- ]]

-- Generic IDE stuff
-- --Callback function for FileType auto command
local function fileTypeCallback()
  vim.api.nvim_set_option_value('colorcolumn', '100', {})
  vim.api.nvim_command [[
    set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
    set smartindent
    set tw=99
    set showmatch
    set nofoldenable
    set comments=sl:/*,mb:\ *,elx:\ */
    ]]
end

-- Callback function for yaml, json, lua, cmake file types
-- Todo: can the colorcolumn be broken out into a separate function?
local function yamlLuaTypeCallback()
  vim.api.nvim_set_option_value('colorcolumn', '100', {})
  vim.api.nvim_command [[
    set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    set smartindent
    set tw=99
    set showmatch
    set nofoldenable
    ]]
end

local function goTypeCallback()
  vim.api.nvim_set_option_value('colorcolumn', '100', {})
  vim.api.nvim_command [[
    set tabstop=8 shiftwidth=8 softtabstop=8 expandtab
    set autoindent
    set smartindent
    set tw=99
    set showmatch
    set nofoldenable
    ]]
end

local idegrp = vim.api.nvim_create_augroup('ide_stuff', { clear = true })

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
  pattern = { '*.ino', '*.pde', '*.c', '*.xbm', '*.cc', '*.h', '*.hpp', '*.cpp' },
  command = 'set filetype=cpp',
  group = idegrp,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'cpp', 'rust' },
  callback = fileTypeCallback,
  group = idegrp,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = goTypeCallback,
  group = idegrp,
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
  pattern = { '*.cmake', 'CMakeLists.txt' },
  command = 'set filetype=cmake',
  group = idegrp,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'yaml', 'lua', 'json', 'cmake' },
  callback = yamlLuaTypeCallback,
  group = idegrp,
})

vim.wo.relativenumber = true -- relative line numbers!
