#!/bin/bash

BASH_SETTINGS_DIR=~/bash-settings
JABBA=~/.jabba/jabba.sh

if [ -f "$BASH_SETTINGS" ]; then
    . "$BASH_SETTINGS";
fi

if [ $NVM_DIR ]; then
    echo "NVM exists!";
else
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
    echo "NVM installed!";
fi

if [ -f "$JABBA" ]; then
    echo "JABBA exists!";
else
    curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash && . ~/.jabba/jabba.sh
    echo "JABBA installed!";
fi

echo "BASH_SETTINGS=~/bash-settings/main.sh" >> ~/.bash_profile;
echo "if [ -f \"\$BASH_SETTINGS\" ]; then" >> ~/.bash_profile;
echo ". \"\$BASH_SETTINGS\";" >> ~/.bash_profile
echo "fi" >> ~/.bash_profile

echo "echo \"Bash settings loaded!\";" >> ~/.bash_profile

if [ -d "$BASH_SETTINGS_DIR" ]; then
    echo "bash-settings dir exists... not creating a new one";
else
    mkdir ~/bash-settings;
    echo "~/bash-settings dir created!";
fi

cp ~/shaun-bash-profile/* ~/bash-settings/
cd ~;

source ~/.bash_profile;
testinstall;