local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- init.lua:
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	{
		"ThePrimeagen/harpoon"
	},

	{
		"mbbill/undotree"
	},

	{
		"tpope/vim-fugitive"
	},

	-- LSP Support
	{"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
	
	{"neovim/nvim-lspconfig"},
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	
	-- Autocompletion
	{"hrsh7th/cmp-nvim-lsp"},
	{"hrsh7th/nvim-cmp"},
	{"hrsh7th/cmp-buffer"},
	{"hrsh7th/cmp-path"},
	
	-- Snippets
	{"L3MON4D3/LuaSnip"},
	{"rafamadriz/friendly-snippets"},

	{"lukas-reineke/lsp-format.nvim"},

}, opts)



