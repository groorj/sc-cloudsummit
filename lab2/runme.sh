#!/bin/bash

yum install httpd -y
if [ ! -f /tmp/done ]; then
	curl https://s3.amazonaws.com/sc-publiccloudsummit/lab2/index.html -o /var/www/html/index.html
	touch /tmp/done
fi
service httpd start

