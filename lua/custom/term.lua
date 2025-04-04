-- Configure terminal related stuff

local function set_terminal_keymaps()
  vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode', noremap = true })
end

local function set_terminal_options()
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
end

local function term_open_callback()
  set_terminal_keymaps()
  set_terminal_options()
end

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = [[term://*]],
  callback = term_open_callback,
})
