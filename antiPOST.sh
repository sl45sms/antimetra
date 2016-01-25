#!/bin/bash
while true; do
BANME=`tail -2 /var/log/apache2/access.log | head -1 |grep ‘\.net\»\|\.biz\»\|\.com\»\|\.ru\»\|\.info\»‘ | grep ‘\»POST \/’ | awk ‘{ print $1}’`
if [[ -z «$BANME» ]]
then
echo .
else
echo «BAN THIS IP $BANME»
ufw insert 1 deny from $BANME
fi
sleep 1
done
