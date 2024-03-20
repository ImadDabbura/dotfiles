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
   "tpope/vim-commentary",
   "tpope/vim-fugitive",
   "tpope/vim-surround",
   "tpope/vim-rhubarb",           -- Enable fugitie's GBrowse and other Github's completions such as issues, commit messages, collaborators, ...
   "tpope/vim-repeat",
   "tpope/vim-unimpaired",
   "tmux-plugins/vim-tmux",       -- useful for tmux config mainly K and :make to source config

  -- colorschemes
  use "joshdick/onedark.vim"
  use "ryanoasis/vim-devicons"

  -- temp plugins
  use "tpope/vim-commentary"
  use "tpope/vim-fugitive"
  use "tpope/vim-surround"
  use "tpope/vim-rhubarb"               -- Enable fugitie's GBrowse and other Github's completions such as issues, commit messages, collaborators, ...
  use "tpope/vim-repeat"
  use "tpope/vim-unimpaired"
  use "christoomey/vim-tmux-navigator"
  use "junegunn/fzf"
  use "junegunn/fzf.vim"
  use "psf/black"

  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
