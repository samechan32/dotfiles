vim.cmd.packadd "packer.nvim"

require("packer").startup(function()
	use { 'wbthomason/packer.nvim' }
	use { 'nvim-telescope/telescope.nvim' }
	use { 'nvim-lua/plenary.nvim' }
	use { 'ghifarit53/tokyonight-vim' }
	use { 'lambdalisue/fern.vim'}
	use { 'rust-lang/rust.vim' }
	use { 'nvim-treesitter/nvim-treesitter',
		  { run = ":TSUpdate" } 
	  	}
	-- LSP
	use { 'neovim/nvim-lspconfig' }
	use { 'williamboman/mason.nvim' }
  	use { 'williamboman/mason-lspconfig.nvim' }
	use { 'hrsh7th/nvim-cmp' }
  	use { 'hrsh7th/cmp-nvim-lsp' } 
  	use { 'hrsh7th/vim-vsnip' }
end)

-- colorthemet
vim.cmd[[colorscheme tokyonight]]

-- telescope
vim.cmd [[
  augroup MyTelescopeSettings
    autocmd!
    autocmd User TelescopePreviewerLoaded setlocal wrap
  augroup END
]]

-- Fern
vim.g["fern#default_hidden"] = 1

-- rustvim
vim.g.rustfmt_autosave = 1
vim.g.rustfmt_command = 'rustup run nightly rustfmt'

--LSP
require('cmp').setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  }
  require('lspconfig')[server].setup(opt)
end })
