# Dotfiles

Configuracion de terminal de `wld` (Linux, zsh + Powerlevel10k + Oh My Zsh, Kitty,
Neovim LazyVim, fastfetch, btop, cmus, Konsole).

## Contenido

| Ruta                 | Descripcion                                              |
|----------------------|----------------------------------------------------------|
| `.zshrc`             | Configuracion principal de zsh                           |
| `.p10k.zsh`          | Tema Powerlevel10k (prompt)                              |
| `.bashrc`, `.profile`, `.bash_logout` | Config de bash              |
| `.fonts.conf`        | Config de fuentes (fontconfig)                           |
| `.oh-my-zsh/custom/` | Plugins (autosuggestions, syntax-highlighting, history-substring-search) y tema p10k |
| `.config/kitty/`     | Terminal Kitty (kitty.conf + theme Catppuccin Mocha)     |
| `.config/nvim/`      | Neovim basado en LazyVim (init.lua, lua/config, lua/plugins) |
| `nvim-lazy/`         | Base de LazyVim y lazy.nvim (se regenera automaticamente)|
| `.config/fastfetch/` | Banner de sistema                                        |
| `.config/btop/`      | Temas de btop                                            |
| `.config/cmus/`      | Biblioteca y playlists de cmus                           |
| `.config/konsolerc`  | Konsole (KDE)                                            |
| `.config/opencode/`  | Config del CLI opencode                                  |
| `install.sh`         | Script para restaurar todo con symlinks                  |

## Instalacion (maquina nueva)

1. Clona el repositorio donde quieras:
   ```bash
   git clone <url-del-repo> ~/dotfiles
   ```
2. Ejecuta el instalador:
   ```bash
   cd ~/dotfiles
   ./install.sh
   ```
3. Recarga la terminal:
   ```bash
   source ~/.zshrc
   ```

> El instalador crea *symlinks* hacia el repositorio. Si el destino ya existe
> como archivo normal, lo respalda como `.bak`. Puedes previsualizar los cambios
> con `./install.sh --dry`.

## Requisitos

- zsh + Oh My Zsh (`~/.oh-my-zsh`)
- Powerlevel10k instalado via `.oh-my-zsh/custom/themes/powerlevel10k`
- Kitty, Neovim (>= 0.9 para LazyVim), fastfetch, btop, cmus

## Notas

- Los repositorios `.git` de los plugins quedan excluidos de esta copia.
- `nvim-lazy/` es la base de LazyVim que lazy.nvim gestiona; puede volver a
  clonarse/regenerarse automaticamente desde `lazy-lock.json`.
- Los historiales (`*.history`), caches y archivos `.bak` se excluyen.