#!/bin/bash
DOWNLOADED_DIR=`pwd`;

cd ~;
# mkdir ~/bash-settings;
# mv $DOWNLOADED_DIR/* ~/bash-settings/
echo "BASH_SETTINGS=~/bash-settings/main.sh
if [ -f \"$BASH_SETTINGS\" ]; then
. \"$BASH_SETTINGS\";
fi

echo \"Bash settings loaded!\";" >> ~/.bash_profile
