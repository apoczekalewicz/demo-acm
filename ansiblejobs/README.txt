external_vars to:

target_clusters - from ACM - list of clusters for example:
- local-cluster
- ocp2

app_name - from AnsibleJob - ex. app1 (used by template, for haproxy template)
lb_domain - from AnsibleJob - ex. lb.example.lab (used by template, for haproxy template)

----

W Ansible Controller skorelowane musza byc dla jobtemplate:
- inventory wskazujace na loadbalancer
- credential umozliwiajacy na dostep do maszyny z haproxy
