#!/usr/bin/env bash

###
# install node.js via nvm
# =======================
###

NVM_PATH="${VAGRANT_HOME}/.nvm"
NODE_VERSION="5.0.0"
NPM_VERSION="3.4.0"

echo_c "Installing nvm..."

git clone git://github.com/creationix/nvm.git $NVM_PATH && cd $NVM_PATH && git checkout `git describe --abbrev=0 --tags`
source $NVM_PATH/nvm.sh
echo "source ${NVM_PATH}/nvm.sh" >> $VAGRANT_HOME/.bashrc

echo_c "Installing node.js v${NODE_VERSION}..."

nvm install $NODE_VERSION
nvm alias default $NODE_VERSION

echo_c "Installing npm v${NPM_VERSION}..."

npm install -g npm@$NPM_VERSION
npm cache clean
npm config set cache-lock-stale 604800000
npm config set cache-min 86400
