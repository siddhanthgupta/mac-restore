#!/bin/zsh
echo "  Setting up AWS CLI"
sudo pip3 install awscli --upgrade

echo "  Installation Complete. Configuring"
echo "  Please select folder which contains your AWS config and credentials"
# select BACKUP_DIR in */; do test -n "$BACKUP_DIR" && break; echo ">>> Invalid Selection"; done
# cd "$BACKUP_DIR" && pwd
vared -c BACKUP_DIR

# Removing trailing slash, if exists.
BACKUP_DIR=$(echo "$BACKUP_DIR"|sed 's/\/$//g')

# When copying, we will add the trailing slash
echo "  Copying over previous config"
mkdir -p $HOME/.aws
cp -r $BACKUP_DIR/ $HOME/.aws
