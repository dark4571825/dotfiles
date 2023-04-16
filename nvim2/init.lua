-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 多一层目录，避免循环调用
require "user.options"
require "user.plugins"
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "VeryLazy",
--   callback = function()
--   end
-- })
require "user.keymaps"
require "user.theme"
require "user.mason"
require "user.neodev"
