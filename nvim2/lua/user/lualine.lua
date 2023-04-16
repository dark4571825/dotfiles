local lualine_config = require('lualine').get_config()
print(lualine_config)

local M = {}

M.options = {
  globalstatus = true
}

function M.setup()
  require('lualine').setup {M.options}
end

return M
