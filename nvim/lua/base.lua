local options = {
	number = true,
	clipboard = "unnamed",
	hlsearch = true,
	shiftwidth = 4,
	tabstop = 4,
	termguicolors = true,
	winblend = 50,
	pumblend = 50,
 }

for k, v in pairs(options) do
  vim.opt[k] = v
end


vim.o.swapfile = false

vim.cmd("augroup MyAutoCmds")
vim.cmd("autocmd!")
vim.cmd("autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE gui=NONE cterm=NONE")
vim.cmd("autocmd ColorScheme * highlight NonText guibg=NONE ctermbg=NONE gui=NONE cterm=NONE")
vim.cmd("autocmd ColorScheme * highlight Folded guibg=NONE ctermbg=NONE gui=NONE cterm=NONE")
vim.cmd("autocmd ColorScheme * highlight EndOfBuffer guibg=NONE ctermbg=NONE gui=NONE cterm=NONE")
vim.cmd("autocmd ColorScheme * highlight LineNr guifg=230 ctermbg=NONE")
vim.cmd('autocmd ColorScheme * highlight comment guifg=230')
vim.cmd("augroup END")

