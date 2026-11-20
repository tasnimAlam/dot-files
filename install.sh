#!/usr/bin/env bash
# Dotfiles installer for Arch Linux.
#
# Usage: ./install.sh [all|packages|link|setup]   (default: all)
#   packages  install packages.txt with paru (bootstraps paru if missing)
#   link      symlink configs into ~/.config, scripts into ~/.local/bin, keyd into /etc
#   setup     post-install: fisher plugins, yazi packages, hypr plugin, doom, default apps
#
# Existing files are moved to ~/.dotfiles-backup/<timestamp>/ before linking.
# Safe to re-run: correct symlinks are left alone.
set -euo pipefail

DOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

# Directories under .config/ linked as a whole into ~/.config/.
CONFIGS=(aerc doom fish ghostty hypr lazygit mpv networkmanager-dmenu nnn noctalia nvim paru s swayimg tmux yazi zathura)
# Single files under .config/.
CONFIG_FILES=(starship.toml)

log() { printf '\e[1;34m::\e[0m %s\n' "$*"; }
have() { command -v "$1" >/dev/null 2>&1; }

# link SRC DST: symlink DST -> SRC, backing up whatever DST was.
link() {
	local src=$1 dst=$2
	[[ -L $dst && $(readlink "$dst") == "$src" ]] && return 0
	if [[ -e $dst || -L $dst ]]; then
		local bak="$BACKUP/${dst#"$HOME"/}"
		mkdir -p "$(dirname "$bak")"
		mv "$dst" "$bak"
		log "backed up $dst -> $bak"
	fi
	mkdir -p "$(dirname "$dst")"
	ln -s "$src" "$dst"
	log "linked $dst"
}

install_packages() {
	if ! have paru; then
		log "bootstrapping paru"
		sudo pacman -S --needed --noconfirm git base-devel
		local tmp
		tmp=$(mktemp -d)
		git clone --depth 1 https://aur.archlinux.org/paru-bin.git "$tmp/paru-bin"
		(cd "$tmp/paru-bin" && makepkg -si --noconfirm)
		rm -rf "$tmp"
	fi
	log "installing packages"
	grep -vE '^\s*(#|$)' "$DOT/packages.txt" | paru -S --needed -
}

link_all() {
	local name
	for name in "${CONFIGS[@]}" "${CONFIG_FILES[@]}"; do
		link "$DOT/.config/$name" "$HOME/.config/$name"
	done
	for name in "$DOT"/scripts/*; do
		link "$name" "$HOME/.local/bin/$(basename "$name")"
	done
	# keyd runs as root and reads /etc, so copy instead of linking into $HOME.
	if ! cmp -s "$DOT/.config/keyd/default.conf" /etc/keyd/default.conf; then
		log "installing /etc/keyd/default.conf"
		sudo install -Dm644 "$DOT/.config/keyd/default.conf" /etc/keyd/default.conf
		sudo systemctl enable --now keyd
		sudo keyd reload
	fi
}

setup() {
	if have fish; then
		log "fisher plugins"
		fish -c 'type -q fisher; or curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source; fisher update'
	fi
	if have ya; then
		log "yazi packages"
		ya pkg install
	fi
	# hyprland.lua require()s this; the repo only tracks it as a bare gitlink.
	local smw="$HOME/.config/hypr/plugins/split-monitor-workspaces"
	if [[ ! -e $smw/init.lua ]]; then
		log "split-monitor-workspaces"
		rmdir "$smw" 2>/dev/null || true
		git clone -b release/0.56.x https://github.com/zjeffer/split-monitor-workspaces "$smw"
	fi
	if have emacs && [[ ! -d $HOME/.config/emacs ]]; then
		log "doom emacs"
		git clone --depth 1 https://github.com/doomemacs/doomemacs "$HOME/.config/emacs"
		"$HOME/.config/emacs/bin/doom" install
	fi
	have xdg-mime && xdg-mime default org.pwmt.zathura.desktop application/pdf
	if have fish && [[ $(getent passwd "$USER" | cut -d: -f7) != */fish ]]; then
		log "setting fish as login shell"
		chsh -s "$(command -v fish)"
	fi
}

case "${1:-all}" in
all) install_packages && link_all && setup ;;
packages) install_packages ;;
link) link_all ;;
setup) setup ;;
*) sed -n '4,7p' "$0" && exit 1 ;;
esac
