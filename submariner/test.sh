oc -n demo-acm create deployment nginx --image=nginxinc/nginx-unprivileged:stable-alpine
oc -n demo-acm expose deployment nginx --port=8080

oc -n demo-acm run tmp-shell --image quay.io/submariner/nettest -- sleep infinity

# oc rsh .. 
# curl http://nginx.default.svc.cluster.local:8080
# curl http://nginx.default.svc.clusterset.local:8080

# subctl show networks
# subctl show connections
# subctl show endpoints

# subctl benchmark latency  ./ocp1/install/auth/kubeconfig ./ocp2/install/auth/kubeconfig
# subctl benchmark throughput  ./ocp1/install/auth/kubeconfig ./ocp2/install/auth/kubeconfig

