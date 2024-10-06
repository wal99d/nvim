return {
	"terrortylor/nvim-comment",
	config = function()
		-- COMMENT
require("nvim_comment").setup({
	operator_mapping = "<leader>/"
})
end,
}
