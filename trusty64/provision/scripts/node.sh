#!/usr/bin/env bash

###
# install node.js via nvm
# =======================
###

NODE_VERSION="5.0.0"
NPM_VERSION="3.4.0"
NVM_PATH="/opt/nvm"

echo_c "Installing nvm..."
groupadd nvm
usermod -G nvm vagrant
usermod -G nvm root
git clone git://github.com/creationix/nvm.git $NVM_PATH && cd $NVM_PATH && git checkout `git describe --abbrev=0 --tags`
mkdir -p /usr/local/nvm /usr/local/node
chown -R root:nvm /usr/local/nvm
chmod -R 775 /usr/local/nvm
cp $PROVISION_FILES/nvm.sh /etc/profile.d/nvm.sh
source /etc/profile.d/nvm.sh

echo_c "Installing node.js v${NODE_VERSION}..."

nvm install $NODE_VERSION
nvm alias default $NODE_VERSION

echo_c "Installing npm v${NPM_VERSION}..."

npm install -g npm@$NPM_VERSION
npm cache clean
npm config set cache-lock-stale 604800000
npm config set cache-min 86400
