return {
  {
    "debugloop/telescope-undo.nvim", -- undo history
    keys = {
      { "<leader>su", "<cmd>Telescope undo<cr>", desc = "Undo History" }, -- space -> s -> u
    },
    config = function() -- idk if this is the best way to do it yet but it works
      require("telescope").setup({
        -- the rest of your telescope config goes here
        extensions = {
          undo = {
            -- telescope-undo.nvim config, see below
          },
        },
      })
      require("telescope").load_extension("undo")
    end,
  },
}
