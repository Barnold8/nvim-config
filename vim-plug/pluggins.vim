call plug#begin('~/.config/nvim/autoload/plugged')

	Plug 	'vyfor/cord.nvim'
	Plug	'preservim/nerdtree'
	Plug    'liuchengxu/vim-which-key'
	Plug    'nvim-telescope/telescope.nvim'
	Plug    'nvim-lua/plenary.nvim'
	Plug	'rbgrouleff/bclose.vim'
	Plug    'francoiscabrol/ranger.vim'
	Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons
	Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
	Plug 'romgrk/barbar.nvim'
	Plug 'OXY2DEV/markview.nvim'

	"Themes"
	
	Plug 	'kepano/flexoki'
	Plug    'folke/tokyonight.nvim'
	Plug 	'morhetz/gruvbox'
	Plug    'rebelot/kanagawa.nvim'
	Plug    'rktjmp/lush.nvim' 
	Plug    'mcchrish/vim-no-color-collections'
	Plug    'nyoom-engineering/nyoom.nvim'

call plug#end()
