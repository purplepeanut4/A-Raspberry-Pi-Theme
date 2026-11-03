#!/bin/bash
# Raspberry Circuit - ES-DE theme updater (Linux / macOS, needs git)
#   ./update-theme-es-de.sh
# First run: downloads the repo and links the theme into ES-DE's themes folder.
# Next runs: pulls the newest version. Restart ES-DE afterwards.
REPO_URL="${REPO_URL:-https://github.com/purplepeanut4/A-Raspberry-Pi-Theme.git}"
BRANCH="${BRANCH:-main}"
CLONE_DIR="${CLONE_DIR:-$HOME/.local/share/rpi-circuit-theme}"
THEMES_DIR="${ES_THEMES_DIR:-$HOME/ES-DE/themes}"
THEME="rpi-berry-theme-es-de"

command -v git >/dev/null || { echo "git is not installed (try: sudo apt install git)"; exit 1; }
if [ -d "$CLONE_DIR/.git" ]; then
    git -C "$CLONE_DIR" fetch --depth 1 -q origin "$BRANCH" && git -C "$CLONE_DIR" reset --hard -q "origin/$BRANCH" || { echo "Could not reach GitHub, keeping the current theme."; exit 1; }
else
    git clone --depth 1 -q -b "$BRANCH" "$REPO_URL" "$CLONE_DIR" || { echo "Could not download the theme."; exit 1; }
fi
mkdir -p "$THEMES_DIR"
if [ -e "$THEMES_DIR/$THEME" ] && [ ! -L "$THEMES_DIR/$THEME" ] && [ -z "$COPY" ]; then
    echo "A normal folder called $THEME is already in $THEMES_DIR."
    echo "Move it away first:  mv \"$THEMES_DIR/$THEME\" \"$THEMES_DIR/$THEME.bak\""; exit 1
fi
if [ -n "$COPY" ]; then            # COPY=1 copies instead of linking (if ES-DE ignores the link)
    rm -rf "$THEMES_DIR/$THEME"; cp -a "$CLONE_DIR/$THEME" "$THEMES_DIR/$THEME"
else
    ln -sfn "$CLONE_DIR/$THEME" "$THEMES_DIR/$THEME"
fi
echo "Raspberry Circuit is up to date ($(git -C "$CLONE_DIR" log -1 --format='%h %s' | cut -c1-70)). Restart ES-DE to see it."
