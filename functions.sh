#!/bin/bash
testinstall () {
    echo "Bash profile installed successfully!";
}

reload () {
    source ~/.bash_profile;
}

startccc () {
    cd $CCC_HOME_DIR/compose;
    docker-compose up -d administrator2-db administrator2-dynamodb;
    cd $CCC_HOME_DIR/admin2/src/main/resources/static;
    yarn;
    docker start admin2;
}

stopccc () {
    cd $CCC_HOME_DIR/compose;
    docker-compose down;
}