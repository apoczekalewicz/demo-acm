#!/bin/bash
NS="openshift-etcd"
POD=$( oc get pod -n $NS | grep -v installer | grep -v quorum | grep -v NAME | tail -1 | awk '{ print $1 }' )
echo I will use $POD in $NS project
oc rsh -c etcdctl -n $NS $POD etcdctl get --prefix=true /
