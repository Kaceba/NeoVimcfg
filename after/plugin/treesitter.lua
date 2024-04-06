require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "asm", "bash", "cmake", "css", "graphql", "haskell", "http", "java", "hlsl", "html", "json", "make", "python", "sql", "xml", "zig", "javascript", "typescript", "c_sharp", "rust", "go", "c", "lua", "vim", "vimdoc", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
