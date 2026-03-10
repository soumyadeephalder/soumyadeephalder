#!/bin/bash

NODE_VERSION=$1

if [ -z "$NODE_VERSION" ]; then
echo "Usage: sudo bash install.sh <node_version>"
echo "Example: sudo bash install.sh 24"
exit 1
fi

echo "================================="
echo "Starting Server Setup"
echo "Node Version: $NODE_VERSION"
echo "================================="

# install base packages

echo "Updating system..."
apt update -y

echo "Installing Nginx, curl, build tools..."
apt install nginx curl build-essential -y

echo "---------------------------------"
echo "Installing NVM"
echo "---------------------------------"

# install nvm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# load nvm

export NVM_DIR="/root/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

echo "---------------------------------"
echo "Installing Node.js v$NODE_VERSION"
echo "---------------------------------"

nvm install $NODE_VERSION
nvm use $NODE_VERSION
nvm alias default $NODE_VERSION

echo ""
echo "Node Version:"
node -v

echo ""
echo "NPM Version:"
npm -v

echo "---------------------------------"
echo "Installing PM2"
echo "---------------------------------"

npm install -g pm2

echo "---------------------------------"
echo "Setting PM2 startup"
echo "---------------------------------"

pm2 startup systemd -u root --hp /root

echo "---------------------------------"
echo "Fixing web directory permission"
echo "---------------------------------"

chown -R $SUDO_USER:$SUDO_USER /var/www/html 2>/dev/null

echo "---------------------------------"
echo "INSTALLATION COMPLETE"
echo "---------------------------------"

echo "Nginx Version:"
nginx -v

echo "Node Version:"
node -v

echo "PM2 Version:"
pm2 -v
