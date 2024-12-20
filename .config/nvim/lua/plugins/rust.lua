return {
	{
		"rayliwell/tree-sitter-rstml",
		ft = "rust",
		dependencies = { "nvim-treesitter" },
		build = ":TSUpdate",
		config = function()
			require("tree-sitter-rstml").setup()
		end,
	},
	{
		"rayliwell/nvim-ts-autotag",
		ft = "rust",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"Saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		opts = {
			completion = {
				crates = {
					enabled = true,
				},
			},
			lsp = {
				enabled = true,
				actions = true,
				completion = true,
				hover = true,
			},
		},
	},
	{
		"mrcjkb/rustaceanvim",
		version = vim.fn.has("nvim-0.10.0") == 0 and "^4" or false,
		ft = { "rust" },
		config = function()
			require("config.rustaceanvim")
		end,
	},
}
