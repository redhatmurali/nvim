#!/bin/bash

echo "🔧 Installing Neovim..."

# Install Neovim (for Debian/Ubuntu-based systems)
sudo apt update && sudo apt install -y neovim curl

echo "✅ Neovim installed!"

# Setup Neovim config directory
echo "📁 Creating Neovim config directory..."
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/colors

echo "⚙️ Creating Neovim config file..."

# Create init.vim with modern dev-friendly config
cat > ~/.config/nvim/init.vim << 'EOF'
" --- General settings ---
syntax enable
set number
set relativenumber
set showmatch
set cursorline
set background=dark
set termguicolors

" --- Indentation ---
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" --- Visual tweaks ---
set nowrap
set scrolloff=5
set wildmenu
set lazyredraw
set incsearch
set hlsearch

" --- Color scheme ---
" Uncomment one of the following:
"colorscheme gruvbox
"colorscheme nord
"colorscheme gruvbox-material
"colorscheme tokyonight
"colorscheme onedark
"colorscheme monokai
"colorscheme kanagawa
"colorscheme everforest
"colorscheme PaperColor
"colorscheme nightfox
colorscheme catppuccin_mocha  " good light blue
"colorscheme rose-pine
"colorscheme base16-gruvbox-dark-medium
EOF

# Create colors directory (Neovim reads from ~/.config/nvim/colors)
echo "🎨 Downloading selected color schemes..."

curl -fsSL https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim \
    -o ~/.config/nvim/colors/gruvbox.vim

curl -fsSL https://raw.githubusercontent.com/catppuccin/vim/main/colors/catppuccin_mocha.vim \
    -o ~/.config/nvim/colors/catppuccin_mocha.vim

# Optional: uncomment more curl lines to download other themes
# curl -fsSL https://raw.githubusercontent.com/arcticicestudio/nord-vim/develop/colors/nord.vim -o ~/.config/nvim/colors/nord.vim
# curl -fsSL https://raw.githubusercontent.com/sainnhe/everforest/master/colors/everforest.vim -o ~/.config/nvim/colors/everforest.vim
# curl -fsSL https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim -o ~/.config/nvim/colors/onedark.vim
# curl -fsSL https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim -o ~/.config/nvim/colors/monokai.vim
# curl -fsSL https://raw.githubusercontent.com/ghifarit53/tokyonight-vim/master/colors/tokyonight.vim -o ~/.config/nvim/colors/tokyonight.vim
# curl -fsSL https://raw.githubusercontent.com/NLKNguyen/papercolor-theme/master/colors/PaperColor.vim -o ~/.config/nvim/colors/PaperColor.vim
# curl -fsSL https://raw.githubusercontent.com/edeneast/nightfox.vim/main/colors/nightfox.vim -o ~/.config/nvim/colors/nightfox.vim
# curl -fsSL https://raw.githubusercontent.com/rose-pine/vim/main/colors/rose-pine.vim -o ~/.config/nvim/colors/rose-pine.vim

echo "✅ Neovim setup complete! Run 'nvim' and enjoy your theme 🎨"
