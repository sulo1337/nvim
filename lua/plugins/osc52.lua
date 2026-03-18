if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- this file enables osc52 clipboard
-- osc cli tool must be installed for this to work
-- https://github.com/theimpostor/osc

if vim.env.TMUX then
  vim.g.clipboard = "tmux"
else
  vim.g.clipboard = "osc52"
end

return {}
