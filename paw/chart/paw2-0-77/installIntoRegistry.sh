#!/bin/bash

###############################################################################
# Must be logged into OC from sudo to run this script.
# If sudo does not have access to OC, run the "oc whoami -t" and replace that part of the podman login command. (this is what we had to do)
# Although we hope to run this rootless
###############################################################################

cd ~/DownloadDirector       # (or wherever you downloaded PAW package)

unzip ipa_workspace_local_dist_2.0.77.106.zip

sudo podman load < paw_2.0.77/images/images.tar

oc patch configs.imageregistry.operator.openshift.io/cluster --patch '{"spec":{"defaultRoute":true}}' --type=merge

REGISTRY_HOST=$(oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}')

sudo podman login -u kubeadmin -p $(oc whoami -t) --tls-verify=false $REGISTRY_HOST

sudo podman tag 127.0.0.1:5000/planninganalytics/pa-glass:3.0.6817-ubi8 $REGISTRY_HOST/dev/pa-glass:3.0.6817-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/pa-cdn:3.0.6817-ubi8 $REGISTRY_HOST/dev/pa-cdn:3.0.6817-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/pa-plan-service:1.0.2022060301-ubi8 $REGISTRY_HOST/dev/pa-plan-service:1.0.2022060301-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/pa-predict-svc:1.0.786-ubi8 $REGISTRY_HOST/dev/pa-predict-svc:1.0.786-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/async-service:0.0.266-ubi8 $REGISTRY_HOST/dev/async-service:0.0.266-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/paw-ui-api:1.0.158-ubi8 $REGISTRY_HOST/dev/paw-ui-api:1.0.158-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/prism-proxy:3.0.10513-ubi8 $REGISTRY_HOST/dev/prism-proxy:3.0.10513-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/share-app:1.0.530-ubi8 $REGISTRY_HOST/dev/share-app:1.0.530-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/share-proxy:1.0.530-ubi8 $REGISTRY_HOST/dev/share-proxy:1.0.530-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/pa-gateway:1.0.1057-ubi8 $REGISTRY_HOST/dev/pa-gateway:1.0.1057-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/bss:1.0.1344-ubi8 $REGISTRY_HOST/dev/bss:1.0.1344-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/wa-proxy:1.0.876-ubi8 $REGISTRY_HOST/dev/wa-proxy:1.0.876-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/tm1proxy:1.0.366-ubi8 $REGISTRY_HOST/dev/tm1proxy:1.0.366-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/palm-service:1.0.193-ubi8 $REGISTRY_HOST/dev/palm-service:1.0.193-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/neo-provision:1.0.356-ubi8 $REGISTRY_HOST/dev/neo-provision:1.0.356-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/prism-app:3.0.5477-ubi8 $REGISTRY_HOST/dev/prism-app:3.0.5477-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/user-admin:1.0.651-ubi8 $REGISTRY_HOST/dev/user-admin:1.0.651-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/monitor:2.0.77.2648-ubi8 $REGISTRY_HOST/dev/monitor:2.0.77.2648-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/prism-platform:3.0.2107.3-ubi8 $REGISTRY_HOST/dev/prism-platform:3.0.2107.3-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/atlas-service:99-ubi8 $REGISTRY_HOST/dev/atlas-service:99-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/admintool:1.0.311-ubi8 $REGISTRY_HOST/dev/admintool:1.0.311-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/pa-content-service:1.0.271-ubi8 $REGISTRY_HOST/dev/pa-content-service:1.0.271-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/couchdb:195-ubi8 $REGISTRY_HOST/dev/couchdb:195-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/bss-init:1.0.288-ubi8 $REGISTRY_HOST/dev/bss-init:1.0.288-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/neo-idviz:9.0.531-ubi8 $REGISTRY_HOST/dev/neo-idviz:9.0.531-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/redis:1.0.178-ubi8 $REGISTRY_HOST/dev/redis:1.0.178-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/ibm-java8:204-ubi8 $REGISTRY_HOST/dev/ibm-java8:204-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/mongo:1.0.174-ubi8 $REGISTRY_HOST/dev/mongo:1.0.174-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/share-platform:1.0.384-ubi8 $REGISTRY_HOST/dev/share-platform:1.0.384-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/mysql-cluster:2.0.170-ubi8 $REGISTRY_HOST/dev/mysql-cluster:2.0.170-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/k8s-config:1.0.106-ubi8 $REGISTRY_HOST/dev/k8s-config:1.0.106-ubi8

sudo podman push $REGISTRY_HOST/dev/pa-glass:3.0.6817-ubi8
sudo podman push $REGISTRY_HOST/dev/pa-cdn:3.0.6817-ubi8
sudo podman push $REGISTRY_HOST/dev/pa-plan-service:1.0.2022060301-ubi8
sudo podman push $REGISTRY_HOST/dev/pa-predict-svc:1.0.786-ubi8
sudo podman push $REGISTRY_HOST/dev/async-service:0.0.266-ubi8
sudo podman push $REGISTRY_HOST/dev/paw-ui-api:1.0.158-ubi8
sudo podman push $REGISTRY_HOST/dev/prism-proxy:3.0.10513-ubi8
sudo podman push $REGISTRY_HOST/dev/share-app:1.0.530-ubi8
sudo podman push $REGISTRY_HOST/dev/share-proxy:1.0.530-ubi8
sudo podman push $REGISTRY_HOST/dev/pa-gateway:1.0.1057-ubi8
sudo podman push $REGISTRY_HOST/dev/bss:1.0.1344-ubi8
sudo podman push $REGISTRY_HOST/dev/wa-proxy:1.0.876-ubi8
sudo podman push $REGISTRY_HOST/dev/tm1proxy:1.0.366-ubi8
sudo podman push $REGISTRY_HOST/dev/palm-service:1.0.193-ubi8
sudo podman push $REGISTRY_HOST/dev/neo-provision:1.0.356-ubi8
sudo podman push $REGISTRY_HOST/dev/prism-app:3.0.5477-ubi8
sudo podman push $REGISTRY_HOST/dev/user-admin:1.0.651-ubi8
sudo podman push $REGISTRY_HOST/dev/monitor:2.0.77.2648-ubi8
sudo podman push $REGISTRY_HOST/dev/prism-platform:3.0.2107.3-ubi8
sudo podman push $REGISTRY_HOST/dev/atlas-service:99-ubi8
sudo podman push $REGISTRY_HOST/dev/admintool:1.0.311-ubi8
sudo podman push $REGISTRY_HOST/dev/pa-content-service:1.0.271-ubi8
sudo podman push $REGISTRY_HOST/dev/couchdb:195-ubi8
sudo podman push $REGISTRY_HOST/dev/bss-init:1.0.288-ubi8
sudo podman push $REGISTRY_HOST/dev/neo-idviz:9.0.531-ubi8
sudo podman push $REGISTRY_HOST/dev/redis:1.0.178-ubi8
sudo podman push $REGISTRY_HOST/dev/ibm-java8:204-ubi8
sudo podman push $REGISTRY_HOST/dev/mongo:1.0.174-ubi8
sudo podman push $REGISTRY_HOST/dev/share-platform:1.0.384-ubi8
sudo podman push $REGISTRY_HOST/dev/mysql-cluster:2.0.170-ubi8
sudo podman push $REGISTRY_HOST/dev/k8s-config:1.0.106-ubi8
