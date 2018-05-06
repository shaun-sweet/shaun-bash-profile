#!/bin/bash
DOWNLOADED_DIR=`pwd`;

cd ~;
mkdir ~/bash-settings;
mv $DOWNLOADED_DIR/* ~/bash-settings/
echo "BASH_SETTINGS=~/bash-settings/main.sh" >> ~/.bash_profile;
echo "if [ -f \"$BASH_SETTINGS\" ]; then" >> ~/.bash_profile;
echo ". \"$BASH_SETTINGS\";" >> ~/.bash_profile
echo "fi" >> ~/.bash_profile

echo "echo \"Bash settings loaded!\";" >> ~/.bash_profile
