if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- this file enables osc52 clipboard
-- osc cli tool must be installed for this to work
-- https://github.com/theimpostor/osc

vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = "osc52"

return {}
