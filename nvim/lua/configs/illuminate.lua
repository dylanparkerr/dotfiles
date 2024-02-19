require("illuminate").configure({})

-- vim.g.Illuminate_ftblacklist={'NvimTree'} -- probably dont need this if im not going to use nvim tree

-- -- change the highlight style
-- vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
-- vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
-- vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
--
-- --- auto update the highlight style on colorscheme change
-- vim.api.nvim_create_autocmd({ "ColorScheme" }, {
-- pattern = { "*" },
-- callback = function(ev)
--     vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
--     vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
--     vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
-- end
-- })
