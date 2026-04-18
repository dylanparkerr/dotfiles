vim.pack.add({
    'https://github.com/carlos-algms/agentic.nvim',
    -- 'https://github.com/github/copilot.vim',          -- official copilot plugin for setting up token
    'https://github.com/nvim-lua/plenary.nvim',       -- dependency for codecompanion
    'https://github.com/olimorris/codecompanion.nvim' -- chat and cli wrapper interfaces for agents
})

-- simpler wrapper around the cli - could be good as it develops
-- require("agentic").setup({
--     provider = 'copilot-acp',
-- })
-- vim.keymap.set({ "n", "v" }, "<leader>a", function() require("agentic").toggle() end, { noremap = true, silent = true })




require("codecompanion").setup({
  interactions = {
    cli = {
      agent = "copilot",
      agents = {
        copilot = {
          cmd = "copilot",
          args = {},
          description = "Github Copilot CLI",
          provider = "terminal",
        },
      },
    },
  },
})

-- TODO : make jk escape in terminal mode like it does for normal mode 

local _, codecompanion = pcall(require, "codecompanion")

-- [a]gent [t]oggle
vim.keymap.set({ "n", "v" }, "<leader>at", function()
  codecompanion.toggle({})
end, { noremap = true, silent = true })

-- [a]gent [p]rompt]
vim.keymap.set({ "n", "v" }, "<leader>ap", function()
  codecompanion.cli({ prompt = true })
end, { desc = "Prompt the CLI agent" })

-- [a]gent [a]dd
vim.keymap.set({ "n", "v" }, "<leader>aa", function()
  codecompanion.cli("#{this}", { focus = false })
end, { desc = "Add context to the CLI agent" })

-- vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
-- vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- this is neet, didnt  know you could do this
-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanionCLI]])
