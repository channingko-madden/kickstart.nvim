-- Configure terminal related stuff

local function set_terminal_keymaps()
  vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode', noremap = true })
end

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = [[term://*]],
  callback = set_terminal_keymaps,
})
