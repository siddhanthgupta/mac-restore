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
brew install git \
             python \
             python3 \
             wget \
             zsh \
             mysql \
             redis \
             tree \
             htop \
             cloc \
             gradle

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

# Setting up Prezto
echo "  Setting up your ZSH using prezto"
./zsh-restore.zsh

# Setting up AWS client
echo "  Setting up your AWS"
./aws-restore.sh

# Setting up SSH keys for github
echo "  Setting up your Git"
./git-restore.sh


echo "  Enjoy your new macbook pro"
echo "  There's some things you manually have to do though:"
echo "    1. Please manually install crossover, dynalist and logitech options"
echo "    2. Login to Skype, Slack, Evernote, Dynalist, Spotify"
echo "    3. Manually restore IntelliJ and PyCharm settings from JAR files"
echo "    4. Manually add tunnelblick VPN client"
echo "    5. Install the Snazzy theme on iterm2, and add keyboard shortcuts"
