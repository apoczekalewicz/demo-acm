oc delete -k guestbook-app/acm-resources
oc delete -k redis-master-app/acm-resources
oc delete -k redis-slave-app/acm-resources
oc delete project guestbook

