-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Use the right clipboard when on WSL
local function is_wsl()
  local wsl_check = os.getenv("WSL_DISTRO_NAME") ~= nil
  return wsl_check
end

if is_wsl() then
  vim.g.clipboard = "" -- responsive but no sync to windows thru wsl :(
  --   vim.g.clipboard = {
  --     name = "win32yank-wsl", -- symlink from windows -> linux path makes this faster for whatever reason
  --     copy = {
  --       ["+"] = "win32yank.exe -i --crlf",
  --       ["*"] = "win32yank.exe -i --crlf",
  --     },
  --
  --     paste = {
  --       ["+"] = "win32yank.exe -o --lf",
  --       ["*"] = "win32yank.exe -o --lf",
  --     },
  --     cache_enabled = 1,
  --   }
  --
  --   -- sync with system clipboard on focus
  --   vim.api.nvim_create_autocmd({ "FocusGained" }, {
  --     pattern = { "*" },
  --     command = [[call setreg("@", getreg("+"))]],
  --   })
  --
  --   -- sync with system clipboard on focus
  --   vim.api.nvim_create_autocmd({ "FocusLost" }, {
  --     pattern = { "*" },
  --     command = [[call setreg("+", getreg("@"))]],
  --   })
end

-- set up specific settings for go to look right and play nice w/ gofmt
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})
