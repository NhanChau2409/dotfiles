return {
  -- Disable markdownlint diagnostics by default.
  -- Marksman LSP and markdown preview remain enabled.
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
        ["markdown.mdx"] = {},
      },
    },
  },

  -- Replace LazyVim's default inline Markdown renderer with markview.nvim.
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },
  {
    "OXY2DEV/markview.nvim",
    ft = { "markdown", "markdown.mdx" },
    opts = {},
  },
}
