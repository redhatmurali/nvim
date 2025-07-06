#!/bin/bash

echo "Installing Neovim + Developer Setup..."

# 1. Install Neovim and tools
sudo apt update
sudo apt install -y neovim curl git unzip ripgrep python3-pip

# 2. Install Node.js (needed for many LSP servers)
if ! command -v node &> /dev/null; then
  echo "Installing Node.js..."
  curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt install -y nodejs
fi

# 3. Setup config directories
mkdir -p ~/.config/nvim/autoload ~/.config/nvim/colors

# 4. Install vim-plug
echo "Installing vim-plug..."
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 5. Write init.vim configuration
echo "Writing Neovim config..."

cat > ~/.config/nvim/init.vim << 'VIMRC'
" ========== Plugins ==========
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" LSP and Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

call plug#end()

" ========== UI ==========
syntax enable
set number relativenumber
set cursorline
set scrolloff=5
set background=dark
set termguicolors
colorscheme catppuccin_mocha

" ========== Telescope ==========
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ========== LSP Setup ==========
lua << LUA
require('lspconfig').pyright.setup{}
require('lspconfig').bashls.setup{}
LUA

" ========== Completion ==========
lua << LUA
local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
  },
})
LUA
VIMRC

# 6. Download colorschemes
curl -fsSL https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim \
  -o ~/.config/nvim/colors/gruvbox.vim

curl -fsSL https://raw.githubusercontent.com/catppuccin/vim/main/colors/catppuccin_mocha.vim \
  -o ~/.config/nvim/colors/catppuccin_mocha.vim

# 7. Install plugins
echo "Installing Neovim plugins..."
nvim +PlugInstall +qall

# 8. Install LSP servers
echo "Installing language servers..."
sudo npm install -g pyright bash-language-server

# 9. Done
echo ""
echo "✅ Neovim Developer Setup Complete!"
echo "👉 Launch Neovim with: nvim"
echo "🔍 Inside Neovim, press <leader>ff to find files using Telescope"
