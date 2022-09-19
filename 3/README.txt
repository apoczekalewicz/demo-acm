- aplikacja app1
- placementrule po labelce app1=true
- automatycznie uaktualniany jest loadbalancer o adresy ingressowe (haproxy)
- tworzone sa domysle routy oraz routa kierujaca na globalny lb

- Dostep do Ansible Controllera poprzez secret 
- W Ansible musi byc jobtemplate o nazwie: lb_reconfig (../ansiblejob/lb_reconfig.yaml)
  https://github.com/apoczekalewicz/demo-acm/blob/master/ansiblejobs/lb_reconfig.yaml
- w ../ansiblejobs/README.txt opisane sa uzywane zmienne

Przygotowanie haproxy:

----

Musi istniec rekord wildcard dla globalnego LB np. *.lb.example.lab (wskazujacy na HAProxy np 192.168.60.11)

---- 

w haproxy.cfg ustawione fronty:
frontend ingress-http
    bind 192.168.60.11:80
    use_backend %[req.hdr(Host),lower]
    default_backend ingress-http

frontend ingress-https 
    bind 192.168.60.11:443
    use_backend %[req.hdr(Host),lower]

jako backend beda uzywane naglowki Host np. app1.lb.example.lab

---

w /etc/sysconfig/haproxy dopisane:
OPTIONS="-f /etc/haproxy/haproxy.d"

aby haproxy korzystalo z dropfiles

----

domyslne backendy w formie dropfile:

/etc/haproxy/haproxy.d/default.cfg:
backend ingress-http
    balance roundrobin
    mode http

backend ingress-https
 balance roundrobin
 mode tcp

-----

ansiblejob bedzie generowac nowe dropfiles np takie:

backend app1.lb.example.lab
    balance roundrobin
    mode http
    server 192.168.60.202 192.168.60.202:80 check
    server 192.168.60.204 192.168.60.204:80 check

backend app1.lb.example.lab-https
 balance roundrobin
 mode tcp
 server 192.168.60.202 192.168.60.202:443 check
 server 192.168.60.204 192.168.60.204:443 check

gdzie adresy 192.168.60.202 i 192.168.60.204 to adresy ingressowe poszczegolnych clusterow OCP

playbook ma zmienna w ktorej dla poszczegolnych nazw klastra zdefiniowane sa ingressowe IP

ACM przekazuje liste klastrow w formie posthooka do AnsibleJoba a ten generuje odpowiedni dropfile dla glownego LB (haproxy)
------

