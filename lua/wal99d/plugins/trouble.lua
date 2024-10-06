return {
	"folke/trouble.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	keys= {
		{"<leader>xx", "<cmd>TroubleToggle<cr>",desc="TroubleToggle"},
		{"<leader>xq", "<cmd>TroubleToggle quickfix<cr>",desc="quickfix"},

	},
	config = function()

		require("trouble").setup{}
	end,
	opts = function (_,opts)
		-- Diagnostic signs
		-- https://github.com/folke/trouble.nvim/issues/52
		local signs = {
			Error = " ",
			Warning = " ",
			Hint = " ",
			Information = " "
		}
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
		end



	end,
}
