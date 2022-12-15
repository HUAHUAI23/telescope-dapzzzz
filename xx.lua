use({
	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.0",
	branch = "0.1.x",
	requires = { { "nvim-lua/plenary.nvim" }, { "HUAHUAI23/telescope-dapzzzz" } },
	config = function()
		require("telescope").setup({})
		require("telescope").load_extension("i23")
	end,
})
