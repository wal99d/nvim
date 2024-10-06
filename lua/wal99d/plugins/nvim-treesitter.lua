return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
      'vrischmann/tree-sitter-templ',
    },
    build = ':TSUpdate',
	config = function()
	vim.filetype.add({ extension = { templ = "templ" } })

		vim.opt.foldmethod="expr"
vim.opt.foldexpr="nvim_treesitter#foldexpr()"
vim.opt.foldenable=false

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "dockerfile",
    "gitignore",
    "go",
    "gomod",
    "gowork",
    "javascript",
    "json",
    "lua",
    "markdown",
    "proto",
    "python",
    "rego",
    "ruby",
    "sql",
    "svelte",
    "yaml",
    "templ",
  },
  indent = {
    enable = true,
  },
  auto_install = true,
  sync_install = false,
  highlight = {
    enable = true,
    disable = { "markdown" },
  --   -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
  --   -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
  --   -- Using this option may slow down your editor, and you may see some duplicate highlights.
  --   -- Instead of true it can also be a list of languages
  --   additional_vim_regex_highlighting = false,
  },
}
	end,
}
