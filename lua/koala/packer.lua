-- Packer: NeoVim Package Manager
-- https://github.com/wbthomason/packer.nvim

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Navigate using Ctrl+HJKL, compatible with tmux
  use 'christoomey/vim-tmux-navigator'
end)
