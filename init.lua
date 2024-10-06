require("wal99d.lazy")
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        require('telescope.builtin').find_files()
    end
})
