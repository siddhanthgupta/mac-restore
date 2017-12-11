#!/bin/zsh
set -e

echo "  Please select your backup runcoms folder:"
# select BACKUP_DIR in */; do test -n "$BACKUP_DIR" && break; echo ">>> Invalid Selection"; done
# cd "$BACKUP_DIR" && pwd
vared -c BACKUP_DIR

# Getting started with prezto installation
rm -rf "${ZDOTDIR:-$HOME}/.zprezto"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Create a new Zsh configuration by copying the Zsh configuration files provided
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  rm -f "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "  Copying over backed up files"

set -x
# Modifying the files in the runcoms
for rcfile in $BACKUP_DIR/^README.md(.N); do
  cp "$rcfile" "${ZDOTDIR:-$HOME}/.zprezto/runcoms/${rcfile:t}"
done

echo "  Please select your zsh history file:"
vared -c ZSH_HISTORY_FILE
echo "  Copying over your zsh history"
cp $ZSH_HISTORY_FILE $HOME/.zhistory

# Change shell (may ask for root password)
chsh -s /bin/zsh
