local options = {
	number = true,
	clipboard = "unnamed",
	hlsearch = true,
	shiftwidth = 4,
	tabstop = 4,
	termguicolors = true,
 }

for k, v in pairs(options) do
  vim.opt[k] = v
end


vim.cmd("augroup MyAutoCmds")
vim.cmd("autocmd!")
vim.cmd("autocmd ColorScheme * highlight LineNr guifg=230")
vim.cmd('autocmd ColorScheme * highlight comment guifg=230')
vim.cmd("augroup END")
