-- Packer: NeoVim Package Manager
-- https://github.com/wbthomason/packer.nvim

-- Bootstrap (ensure Packer is installed)

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()

-- Plugin startup

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-------------------
	-- Customization --
	-------------------

	-- Onedark Theme
	use {
		'navarasu/onedark.nvim',
		config = function()
			local onedark = require('onedark')
			onedark.setup { style = 'deep', transparent = true }
			onedark.load()
		end
	}

	--------------
	-- Features --
	--------------

	-- Telescope (fuzzy search)
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use ( 
		'nvim-treesitter/nvim-treesitter', 
		{ run = ':TSUpdate' }
	)

	-- Navigate using Ctrl+HJKL, compatible with tmux
	use 'christoomey/vim-tmux-navigator'

	----------
	-- Misc --
	----------

	-- Vim Games
	use 'ThePrimeagen/vim-be-good'

	-- Load configuration automatically after installing Packer
	if packer_bootstrap then
		require('packer').sync()
	end
end)
