#!/usr/bin/env bash

###
# install node.js via nvm
# =======================
###

NVM_PATH="${VAGRANT_HOME}/.nvm"
NODE_VERSION="5.1.1"
NPM_VERSION="3.5.1"

echo_c "Installing nvm..."
git clone git://github.com/creationix/nvm.git $NVM_PATH && cd $NVM_PATH && git checkout `git describe --abbrev=0 --tags`

cat >>/etc/profile <<EOL
export NVM_DIR=${NVM_PATH}
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
EOL

export NVM_DIR=$NVM_STORAGE
source $NVM_PATH/nvm.sh

echo_c "Installing node.js v${NODE_VERSION}..."

nvm install $NODE_VERSION
nvm alias default $NODE_VERSION
ln -s ${NVM_PATH}/versions/node/v${NODE_VERSION} ${NVM_PATH}/versions/node/current

echo_c "Installing npm v${NPM_VERSION}..."

npm install -g npm@$NPM_VERSION
npm cache clean
npm config set cache-lock-stale 604800000
npm config set cache-min 86400
