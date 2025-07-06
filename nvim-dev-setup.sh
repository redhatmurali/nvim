#!/bin/bash

echo "🔧 Installing Neovim + Developer Setup..."

# 1. Install Neovim and required tools (Ubuntu/Debian)
sudo apt update
sudo apt install -y neovim curl git unzip ripgrep python3-pip

# 2. Install Node.js (needed by some LSP servers)
if ! command -v node &> /dev/null; then
  echo "📦 Installing Node.js..."
  curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt install -y nodejs
fi

# 3. Setup Neovim config
mkdir -p ~/.config/nvim/autoload ~/.config/nvim/colors

# 4. Install vim-plug plugin manager
echo "🔌 Installing vim-plug..."
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 5. Create init.vim config
echo "⚙️ Writing Neovim config..."

cat > ~/.config/nvim/init.vim << 'EOF'
" ========== Plugins ==========
call plug#begin('~/.config/nvim/plugged')

" Color schemes
Plug 'morhetz/gruvbox'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" Telescope and dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" LSP and Autocompletion
Plug 'neovim/nvim-lspconfig'        " Config for built-in LSP
Plug 'hrsh7th/nvim-cmp'             " Completion plugin
Plug 'hrsh7th/cmp-nvim-lsp'         " LSP source for nvim-cmp
Plug 'L3MON4D3/LuaSnip'             " Snippet engine

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
lua << EOF
require('lspconfig').pyright.setup{}
require('lspconfig').bashls.setup{}
EOF

" ========== Completion ==========
lua << EOF
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
EOF
EOF

# 6. Download color schemes
curl -fsSL https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim \
  -o ~/.config/nvim/colors/gruvbox.vim

curl -fsSL https://raw.githubusercontent.com/catppuccin/vim/main/colors/catppuccin_mocha.vim \
  -o ~/.config/nvim/colors/catppuccin_mocha.vim

# 7. Install plugins
echo "📦 Installing plugins..."
nvim +PlugInstall +qall

# 8. Install Python LSP (pyright) and bash LSP
echo "🧠 Installing LSP servers..."
sudo npm install -g pyright
sudo npm install -g bash-language-server

echo "✅ Neovim developer setup complete!"
echo "💡 Open Neovim with: nvim"
echo "🔎 Use <leader>ff to find files (Telescope)"
