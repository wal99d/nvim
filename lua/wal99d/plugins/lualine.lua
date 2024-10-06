return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- LUALINE
require("lualine").setup{
	options = {
		icons_enabled = true,
		theme = "onedark",
		component_separators = "|",
		section_separators = "",
	},
}
end,
}
