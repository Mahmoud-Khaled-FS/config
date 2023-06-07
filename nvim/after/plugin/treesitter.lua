require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { 
	  "cpp",
	  "lua",
	  "vim", 
	  "vimdoc",
	  "query",
	  "html",
	  "css",
	  "javascript",
	  "typescript",
	  "svelte",
	  "json",
	  "http",
	  "go",
	  "v",
	  "rust",
	  "sql",
	  "python",
	  "gomod",
	  "gosum"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
