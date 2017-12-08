# Mac-Restore
----
Simple set of scripts to auto-install my custom dev environment in MacOS

## Prerequisites

You need to have a directory locally (restored from a backup) which contains your prezto related files:

1. `.zshrc`
2. `.zprezto`
3. `.zhistory`

You also need to have a similar directory containing your AWS credentials and config

## Running the script

You cannot git-clone the repo (because git isn't installed yet). Just download the zip, unzip in some directory, open a terminal in this directory and type the following commands

```
chmod u+x mac-restore.sh
chmod u+x zsh-restore.zsh
./mac-restore.sh
```
