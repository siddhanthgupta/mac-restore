#!/bin/zsh

# Making the SSH folder if it doesn't exist
mkdir -p "$HOME/.ssh"

# For gitconfig
echo "  Please select where your gitconfig is"
vared -c BACKUP_DIR
cp $BACKUP_DIR/.gitconfig $HOME/.gitconfig

echo "  Generating your new SSH key for github"
echo "  Enter your passphrase for the SSH key: "
read -s PASSWORD

# Generating the SSH-Key
ssh-keygen  -t rsa \
            -b 4096 \
            -C "siddhanth@codenation.co.in" \
            -f "$HOME/.ssh/github_rsa" \
            -N $PASSWORD \

# Starting the SSH agent
eval "$(ssh-agent -s)"

# vim ~/.ssh/config
touch "$HOME/.ssh/config"
cat <<EOM >> "$HOME/.ssh/config"
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/github_rsa
EOM

ssh-add -K $HOME/.ssh/github_rsa
pbcopy < $HOME/.ssh/github_rsa.pub

echo "  Key copied to clipboard. A browser window will open to register your new SSH key"
echo "  Add a title, and paste the content in clipboard in the key field "

# Shows a countdown before browser window opens
for i in {5..2}; do
  printf '\rBrowser window opening in %d seconds' $i
  sleep 1
done

# To change the output when 1 second remains (singular)
printf "\rBrowser window opening in 1 second "
sleep 1
echo ""

# Opens the link
open https://github.com/settings/ssh/new
