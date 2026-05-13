local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'tpope/vim-fugitive' }

vim.pack.add { gh 'mechatroner/rainbow_csv' }

vim.pack.add { gh 'pcolladosoto/tinygo.nvim' }
require('tinygo').setup {}

vim.pack.add { gh 'MeanderingProgrammer/render-markdown.nvim' }
require('render-markdown').setup {}
