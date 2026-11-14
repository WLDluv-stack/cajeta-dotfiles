# 🐚 Dotfiles

![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black)
![Zsh](https://img.shields.io/badge/Zsh-1A2B34?style=flat&logo=gnu-bash&logoColor=white)
![Neovim](https://img.shields.io/badge/Neovim-57A143?style=flat&logo=neovim&logoColor=white)
![Kitty](https://img.shields.io/badge/Kitty-000000?style=flat&logo=kitty&logoColor=white)
![Catppuccin](https://img.shields.io/badge/Catppuccin%20Mocha-CDD6F4?style=flat&logo=catppuccin&logoColor=black)

Configuración de terminal de `wld` para Linux: **zsh + Powerlevel10k + Oh My Zsh**, terminal **Kitty** con tema Catppuccin Mocha, **Neovim** con LazyVim, y herramientas como fastfetch, btop y cmus.

## 🚀 Instalación rápida

En una máquina nueva, solo son tres pasos:

```bash
git clone https://github.com/WLDluv-stack/cajeta-dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Después recarga la terminal:

```bash
source ~/.zshrc
```

> El instalador crea *symlinks* hacia el repositorio. Si el destino ya existe, lo respalda como `.bak` (archivos y carpetas). Puedes previsualizar los cambios sin tocar nada con `./install.sh --dry`.

## 📦 Qué incluye

| Ruta | Descripción |
| ---- | ----------- |
| `.zshrc` | Configuración principal de zsh |
| `.p10k.zsh` | Tema Powerlevel10k (prompt) |
| `.bashrc`, `.profile`, `.bash_logout` | Config de bash |
| `.fonts.conf` | Config de fuentes (fontconfig) |
| `.oh-my-zsh/custom/` | Plugins (autosuggestions, syntax-highlighting, history-substring-search) y tema p10k |
| `.config/kitty/` | Terminal Kitty (kitty.conf + tema Catppuccin Mocha) |
| `.config/nvim/` | Neovim basado en LazyVim (init.lua, lua/config, lua/plugins) |
| `nvim-lazy/` | Base de LazyVim y lazy.nvim (se regenera automáticamente) |
| `.config/fastfetch/` | Banner de sistema |
| `.config/btop/` | Temas de btop |
| `.config/cmus/` | Biblioteca y playlists de cmus |
| `.config/konsolerc` | Konsole (KDE) |
| `.config/opencode/` | Config del CLI opencode |
| `install.sh` | Script para restaurar todo con symlinks |

## ✅ Requisitos

- zsh + Oh My Zsh (`~/.oh-my-zsh`)
- Powerlevel10k instalado en `.oh-my-zsh/custom/themes/powerlevel10k`
- Kitty, Neovim (>= 0.9 para LazyVim), fastfetch, btop, cmus

## 🔧 Cómo funciona `install.sh`

El script enlaza cada archivo y carpeta con symlinks hacia el repositorio, así que editar un archivo en `~/dotfiles` actualiza tu configuración al instante. Lo que enlaza:

1. Archivos raíz del home: `.bash_logout`, `.bashrc`, `.fonts.conf`, `.p10k.zsh`, `.profile`, `.zshrc`
2. `.oh-my-zsh/custom` (plugins y temas)
3. `.config/nvim` y la base de LazyVim en `~/.local/share/nvim/lazy`
4. Todo lo que haya en `.config/` (kitty, btop, cmus, fastfetch, opencode, konsolerc)

## 📝 Notas

- Los repositorios `.git` de los plugins quedan excluidos de esta copia.
- `nvim-lazy/` es la base de LazyVim que lazy.nvim gestiona; puede volver a clonarse/regenerarse automáticamente desde `lazy-lock.json`.
- Los historiales (`*.history`), cachés y archivos `.bak` se excluyen.
