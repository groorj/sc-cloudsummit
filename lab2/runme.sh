#!/bin/bash

sleep 60
yum install httpd -y
if [ ! -f /tmp/done ]; then
	curl https://s3.amazonaws.com/sc-publiccloudsummit/lab2/index.html -o /var/www/html/index.html
	touch /tmp/done
fi
service httpd start
sleep 60
yum install httpd -y
service httpd start
if [ ! -f /tmp/done ]; then
	curl https://s3.amazonaws.com/sc-publiccloudsummit/lab2/index.html -o /var/www/html/index.html
	touch /tmp/done
fi


STACK_NAME=`cat /tmp/stack-name.txt`
curl https://sc-pcsummit-${STACK_NAME}.s3-us-west-1.amazonaws.com/index.html -fo /tmp/new-index.html
if [ -f /tmp/new-index.html ]; then
	cp /tmp/new-index.html /var/www/html/index.html
fi



