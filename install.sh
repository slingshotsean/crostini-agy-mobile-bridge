#!/usr/bin/env bash
set -e
sudo loginctl enable-linger "$USER" 2>/dev/null || true
[ -x "/opt/Antigravity/Antigravity-x64/antigravity" ] && sudo cp bin/agy-headless /usr/local/bin/agy && sudo chmod +x /usr/local/bin/agy
mkdir -p "$HOME/.config/crostini-mobile-bridge"
cp shell/tell.sh "$HOME/.config/crostini-mobile-bridge/tell.sh"
grep -q "crostini-mobile-bridge/tell.sh" "$HOME/.bashrc" || echo "source $HOME/.config/crostini-mobile-bridge/tell.sh" >> "$HOME/.bashrc"
echo "Installed crostini-agy-mobile-bridge!"
