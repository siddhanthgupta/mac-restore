#!/bin/bash
set -x

echo "  Installing Brew"
# Check that Homebrew is installed and install if not
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
else
  echo "  Brew already installed"
fi

# Update any existing homebrew recipes and any already installed formulae
echo "  Updating Brew and any installed formulae"
brew update
brew upgrade --all

echo "  Installing brew formulae"
brew install git python3 wget zsh

echo "  Installing Brew Caskroom"
brew tap caskroom/cask

echo "  Installing all important software"
brew cask install atom \
                  sublime-text \
                  java \
                  gotomeeting \
                  pycharm-ce \
                  google-featured-photos \
                  sequel-pro \
                  skype \
                  slack \
                  tunnelblick \
                  intellij-idea-ce \
                  evernote \
                  hacker-menu \
                  google-chrome \
                  zoomus \
                  recordit \
                  docker \
                  iterm2 \
                  spotify

# Remove brew cruft
echo "  Installation complete. Cleaning up."
brew cleanup

# Remove cask cruft
brew cask cleanup

echo "  Setting up your Prezto"
source custom_prezto_installer.zsh

echo "  Setting up AWS CLI"
sudo pip3 install awscli --upgrade

echo "  Installation Complete. Configuring"
echo "  Please select folder which contains your prezto backup files:"
# select BACKUP_DIR in */; do test -n "$BACKUP_DIR" && break; echo ">>> Invalid Selection"; done
# cd "$BACKUP_DIR" && pwd
vared -c BACKUP_DIR

echo "  Copying over previous config"
mkdir -p $HOME/.aws
cp -r $BACKUP_DIR $HOME/.aws

echo "  Enjoy your new macbook pro"
echo "  There's some things you manually have to do though:"
echo "    1. Please manually install dynalist and logitech options"
echo "    2. Login to Skype, Slack, Evernote, Dynalist, Spotify"
echo "    3. Manually restore IntelliJ and PyCharm settings from JAR files"
echo "    4. Manually add tunnelblick VPN client"
