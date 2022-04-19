#!/bin/bash
oc new-project demo-acm-project1
oc project demo-acm-project1
oc create cm artur --from-literal=ARTUR_KEY=ARTUR_VALUE
