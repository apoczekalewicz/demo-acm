## Repository for demo Submariner and RHACM
# cloned from https://github.com/rcarrata/acm-demo-app/

All of this commands needs to be performed in the ACM Hub cluster to deploy through GitOps.

* Deploy the GuestBook App in cluster Managed 1

```
oc apply -k guestbook-app/acm-resources
```

* Deploy the Redis Master App in Cluster Managed 1

```
oc apply -k redis-master-app/acm-resources
```

* Deploy the Redis Slave App in Cluster Managed 2

```
oc apply -k redis-slave-app/acm-resources
```
