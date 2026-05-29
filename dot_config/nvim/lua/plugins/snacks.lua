return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true, -- show everything in the tree
          },
          files = {
            hidden = true, -- show dotfiles/hidden dirs
            -- no ignored = true here, so gitignored files stay out of fuzzy find
          },
        },
      },
    },
  },
}
