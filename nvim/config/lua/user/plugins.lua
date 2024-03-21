local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

-- Install your plugins here
return lazy.setup({
    -- themes
    {
        "joshdick/onedark.vim",
        lazy = true,
    },
    {
        "rose-pine/neovim",
        lazy = true,
        name = "rose-pine"
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 1000
    },
    {
        "bluz71/vim-nightfly-colors",
        name = "nightfly",
        lazy = false,
        priority = 1000
    },
   "tpope/vim-commentary",
   "tpope/vim-fugitive",
   "tpope/vim-surround",
   "tpope/vim-rhubarb",           -- Enable fugitie's GBrowse and other Github's completions such as issues, commit messages, collaborators, ...
   "tpope/vim-repeat",
   "tpope/vim-unimpaired",
   "tmux-plugins/vim-tmux",       -- useful for tmux config mainly K and :make to source config

    -- Revisit the following plugins for complete setup/understanding
   "kshenoy/vim-signature",       -- Toggle & display marks (Revisit)
    {
     "folke/trouble.nvim",
     dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    "folke/zen-mode.nvim",
    "mbbill/undotree",
    {
      "christoomey/vim-tmux-navigator",
      cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
      },
      keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
      },
    },
   "nvim-lua/popup.nvim",             -- An implementation of the Popup API from vim in Neovim
   "nvim-lua/plenary.nvim",           -- Useful lua functions used by lots of plugins
   "junegunn/fzf",
   "junegunn/fzf.vim",
   "psf/black",
})
