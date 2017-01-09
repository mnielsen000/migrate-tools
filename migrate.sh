#!/bin/bash

# get document root for Apache
# grep DocumentRoot in /etc/httpd/conf/httpd.conf
# Example: DocumentRoot "/var/elasticbox/i-ogc9cn"

docroot=$(grep "^DocumentRoot" -m 1 /etc/httpd/conf/httpd.conf)

echo $docroot;
docpath=$(echo $docroot | cut -c 15- | head --bytes -2)
echo $docpath;


# change to docroot path
cd $docpath;

rm -rf *
rm -rf .* 2> /dev/null

# clone git branch with data to migrate

#git clone -b migrate --single-branch https://github.com/mnielsen000/migrate-php.git .


