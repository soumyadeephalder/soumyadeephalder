#!/bin/bash

NODE_VERSION=$1

if [ -z "$NODE_VERSION" ]; then
echo "Usage: bash install.sh <node_version>"
echo "Example: bash install.sh 24"
exit 1
fi

echo "Start Your Install ....."
echo "Node Version: $NODE_VERSION"

if [ "$EUID" == 0 ]
then
apt update
apt install nginx -y
apt install curl build-essential -y

```
sleep 1

echo "Installing NVM..."

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

sleep 1

echo "Installing Node.js v$NODE_VERSION..."

nvm install $NODE_VERSION
nvm use $NODE_VERSION
nvm alias default $NODE_VERSION

echo ""
node -v
npm -v

echo "Node Js install done !"

npm install -g pm2

echo ""
echo "Done all install"

chown -R $SUDO_USER:$SUDO_USER /var/www/html
```

else
echo "pls use sudo OR root user"
fi
