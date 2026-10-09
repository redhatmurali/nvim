# 🚀 Neovim Developer Environment Setup

A setup script for configuring a modern Neovim development environment with themes, autocompletion, language-server support, fuzzy finding, and plugin management.

## ✨ Features

- ✅ **Neovim** — modern terminal-based code editor
- 🎨 **Themes** — Catppuccin, Gruvbox, and more
- 🔭 **Telescope** — fuzzy file finding and search
- 🧠 **LSP support**
  - Python via `pyright`
  - Bash via `bash-language-server`
- ⚡ **Autocompletion** — powered by `nvim-cmp`
- 📦 **Plugin management** — via `vim-plug` or the manager configured by the script

## 📥 Installation

### Option 1: Run directly using `curl`

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/redhatmurali/nvim/main/nvim-dev-setup.sh)
```

### Option 2: Download using `wget`

```bash
wget -qO nvim-dev-setup.sh https://raw.githubusercontent.com/redhatmurali/nvim/main/nvim-dev-setup.sh

chmod +x nvim-dev-setup.sh

./nvim-dev-setup.sh
```

### Option 3: Clone the repository

```bash
git clone https://github.com/redhatmurali/nvim.git
cd nvim
chmod +x nvim-dev-setup.sh
./nvim-dev-setup.sh
```

> **Security tip:** Review the script before executing it, especially if running it with `sudo`.

## 🛠️ Requirements

- Linux environment
- Internet connectivity
- `curl` or `wget`
- `git`
- Appropriate permissions to install packages

Additional requirements depend on the language servers and tools you choose.

## 🐍 Python Development

The environment is intended to support Python language-server integration through `pyright`.

## 🐚 Bash Development

Bash language support uses `bash-language-server`.

## 🎨 Customization

After installation, open Neovim:

```bash
nvim
```

Configure your preferred theme, plugins, key mappings, and language servers according to your workflow.

## 📂 Repository Structure

```text
nvim/
├── README.md
└── nvim-dev-setup.sh
```

## 🔗 Repository

[View the source code on GitHub](https://github.com/redhatmurali/nvim)

## 📄 License

Add a `LICENSE` file if you intend to distribute this project for reuse.
