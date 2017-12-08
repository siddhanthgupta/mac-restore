#!/bin/zsh
set -e

echo "  Please select folder which contains your prezto backup files:"
# select BACKUP_DIR in */; do test -n "$BACKUP_DIR" && break; echo ">>> Invalid Selection"; done
# cd "$BACKUP_DIR" && pwd
vared -c BACKUP_DIR


# Getting started with prezto installation
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Create a new Zsh configuration by copying the Zsh configuration files provided
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "  Copying over backed up files"
# Modifying the files in the runcoms
cp "${BACKUP_DIR}"/.zpreztorc "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zpreztorc
cp "${BACKUP_DIR}"/.zshrc "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zshrc

echo "  Copying over your zsh history"
cp "${BACKUP_DIR}"/.zhistory $HOME/.zhistory

# Change shell (may ask for root password)
chsh -s /bin/zsh
