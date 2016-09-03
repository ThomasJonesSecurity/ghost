apt-get update && apt-get upgrade --assume-yes && apt-get -y dist-upgrade
apt-get update && apt-get upgrade --assume-yes
apt-get install zip wget git npm nodejs build-essential libssl-dev --assume-yes
apt-get --assume-yes --purge autoremove
apt-get clean

mkdir -p /var/www/ghost
cd /var/www/ghost
wget https://ghost.org/zip/ghost-latest.zip
unzip ghost-latest.zip -d blog.domain.com
rm ghost-latest.zip
cd blog.domain.com
npm install --production
cd /var/www
chown -R ghost:ghost ghost

cd /var/www/ghost/blog.domain.com/
sed -i 's/my-ghost-blog.com/blog.domain.com/g' config.js
