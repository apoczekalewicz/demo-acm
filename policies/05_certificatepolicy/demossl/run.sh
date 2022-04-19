mkdir -p /tmp/app
cp -r manifests /tmp/app

openssl req -new -newkey rsa:4096 -days 25 -nodes -x509 -subj "/C=US/ST=NC/L=Raleigh/O=Example/CN=www.example.com" -keyout /tmp/app/tls.key -out /tmp/app/tls.crt

oc create secret generic certs --from-file=tls.key=/tmp/app/tls.key --from-file=tls.crt=/tmp/app/tls.crt -o yaml --dry-run=client  > /tmp/app/manifests/secret.yml

echo Go to /tmp/app and use manifets in proper project
#openssl s_client -connect demossl-ansibletest.apps.ocp1.example.lab:443  | openssl x509 -text|less
