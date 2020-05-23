#!/bin/sh

#Create users
#USERS='name1|password1'

#Default user 'amin' with password 'squidpass'

if [ -z "$USERS" ]; then
  USERS="amin|squidpass"
fi

touch /etc/squid/users

realm="MyRealm"

for i in $USERS ; do
    user=$(echo $i | cut -d'|' -f1)
    pass=$(echo $i | cut -d'|' -f2)
    digest="$( printf "%s:%s:%s" "$user" "$realm" "$pass" | md5sum | awk '{print $1}' )"
    printf "%s:%s:%s\n" "$user" "$realm" "$digest" >> "/etc/squid/users"
done

echo "auth_param digest program /usr/lib/squid/digest_file_auth -c /etc/squid/users
auth_param digest children 5
auth_param digest realm "$realm"

acl users proxy_auth REQUIRED
http_access allow users
http_access deny all" >> /etc/squid/squid.conf

exec "$@"
