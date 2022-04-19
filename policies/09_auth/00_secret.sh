htpasswd -c -B -b ./tmpfile admin admin
htpasswd -B -b ./tmpfile user user
SECRET=$( base64 -w0 tmpfile )
sed -i "s/CHANGEME/$SECRET/g" 02_htpasswd-auth.yaml
rm -f ./tmpfile
