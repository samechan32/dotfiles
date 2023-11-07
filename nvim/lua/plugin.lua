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
	use {
		'windwp/nvim-autopairs',
    	config = function() require("nvim-autopairs").setup {} end
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
local cmp = require('cmp')
cmp.setup {
  preselect = cmp.PreselectMode.None,
      -- スニペットの設定
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
      end,
  },
  sources = {
    { name = 'nvim_lsp' }
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
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

-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true }
)
