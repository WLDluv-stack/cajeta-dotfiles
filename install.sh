#!/usr/bin/env bash
#
# install.sh — Restaura los dotfiles creando symlinks hacia este directorio.
# Uso:  ./install.sh          (modo normal)
#       ./install.sh --dry    (solo muestra lo que haria)
#
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DRY=false
[[ "${1:-}" == "--dry" ]] && DRY=true

home_dir() {
    echo "${HOME}"
}

LOG_OK=()
LOG_SKIP=()

link_file() {
    local src="$1" dest="$2"
    if [[ "$DRY" == true ]]; then
        echo "  [dry] enlazar $src -> $dest (con respaldo .bak si existe)"
        LOG_OK+=("$dest")
        return
    fi
    if [[ -h "$dest" ]]; then
        rm -f "$dest"
    elif [[ -e "$dest" ]]; then
        mv "$dest" "${dest}.bak"
        echo "  respaldo creado: ${dest} -> ${dest}.bak"
    fi
    ln -s "$src" "$dest"
    LOG_OK+=("$dest")
}

link_dir() {
    local src="$1" dest="$2"
    if [[ "$DRY" == true ]]; then
        echo "  [dry] enlazar dir $src -> $dest (con respaldo .bak si existe)"
        LOG_OK+=("$dest")
        return
    fi
    if [[ -h "$dest" ]]; then
        rm -f "$dest"
    elif [[ -e "$dest" ]]; then
        mv "$dest" "${dest}.bak"
        echo "  respaldo creado: ${dest} -> ${dest}.bak"
    fi
    ln -s "$src" "$dest"
    LOG_OK+=("$dest")
}

run() {
    if [[ "$DRY" == true ]]; then
        echo "  [dry] $*"
    else
        "$@"
    fi
}

mkdir_p() {
    if [[ "$DRY" == true ]]; then
        echo "  [dry] mkdir -p $1"
    else
        mkdir -p "$1"
    fi
}

echo "Dotfiles: $DOTFILES_DIR"
echo "Home:     $HOME"
echo

# --- Archivos individuales del HOME ---------------------------------------
echo "== Archivos raiz =="
for name in .bash_logout .bashrc .fonts.conf .p10k.zsh .profile .zshrc; do
    link_file "$DOTFILES_DIR/$name" "$HOME/$name"
done

# --- .oh-my-zsh/custom (plugins y temas) ----------------------------------
echo "== Oh My Zsh custom =="
mkdir_p "$HOME/.oh-my-zsh"
link_dir "$DOTFILES_DIR/.oh-my-zsh/custom" "$HOME/.oh-my-zsh/custom"

# --- Neovim (config en ~/.config/nvim) ------------------------------------
echo "== Neovim =="
mkdir_p "$HOME/.config"
link_dir "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"

# --- Base de LazyVim en ~/.local/share/nvim/lazy --------------------------
echo "== LazyVim =="
mkdir_p "$HOME/.local/share/nvim"
link_dir "$DOTFILES_DIR/nvim-lazy" "$HOME/.local/share/nvim/lazy"

# --- Configuraciones en ~/.config ------------------------------------------
echo "== .config =="
while IFS= read -r d; do
    name="$(basename "$d")"
    link_dir "$DOTFILES_DIR/.config/$name" "$HOME/.config/$name"
done < <(find "$DOTFILES_DIR/.config" -maxdepth 1 -mindepth 1 | sort)

echo
echo "Completado:"
printf '  - %s\n' "${LOG_OK[@]}"
echo
echo "Recarga la configuracion con: source ~/.zshrc"