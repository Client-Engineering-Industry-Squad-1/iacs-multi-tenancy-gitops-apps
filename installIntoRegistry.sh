#!/bin/bash

###############################################################################
# Must be logged into OC from sudo to run this script.
# If sudo does not have access to OC, run the "oc whoami -t" and replace that part of the podman login command. (this is what we had to do)
# Although we hope to run this rootless
###############################################################################

#unzip <Zip File>

#sudo podman load < <PAW Version>/images/images.tar

sudo oc patch configs.imageregistry.operator.openshift.io/cluster --patch '{"spec":{"defaultRoute":true}}' --type=merge

#REGISTRY_HOST=$(sudo oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}')

sudo podman login -u kubeadmin -p $(sudo oc whoami -t) --tls-verify=false $REGISTRY_HOST

sudo podman tag 127.0.0.1:5000/planninganalytics/pa-glass:${GLASS_VERSION}-ubi8 $REGISTRY_HOST/dev/pa-glass:${GLASS_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/pa-cdn:${CDN_VERSION}-ubi8 $REGISTRY_HOST/dev/pa-cdn:${CDN_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/pa-plan-service:${PA_PLAN_SERVICE_VERSION}-ubi8 $REGISTRY_HOST/dev/pa-plan-service:${PA_PLAN_SERVICE_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/pa-predict-svc:${PA_PREDICT_SVC_VERSION}-ubi8 $REGISTRY_HOST/dev/pa-predict-svc:${PA_PREDICT_SVC_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/async-service:${ASYNC_SERVICE_VERSION}-ubi8 $REGISTRY_HOST/dev/async-service:${ASYNC_SERVICE_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/paw-ui-api:${PAW_UI_API_VERSION}-ubi8 $REGISTRY_HOST/dev/paw-ui-api:${PAW_UI_API_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/prism-proxy:${PRISM_PROXY_VERSION}-ubi8 $REGISTRY_HOST/dev/prism-proxy:${PRISM_PROXY_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/share-app:${SHARE_APP_VERSION}-ubi8 $REGISTRY_HOST/dev/share-app:${SHARE_APP_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/share-proxy:${SHARE_PROXY_VERSION}-ubi8 $REGISTRY_HOST/dev/share-proxy:${SHARE_PROXY_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/pa-gateway:${PA_GATEWAY_VERSION}-ubi8 $REGISTRY_HOST/dev/pa-gateway:${PA_GATEWAY_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/bss:${BSS_VERSION}-ubi8 $REGISTRY_HOST/dev/bss:${BSS_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/wa-proxy:${WA_PROXY_VERSION}-ubi8 $REGISTRY_HOST/dev/wa-proxy:${WA_PROXY_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/tm1proxy:${TM1PROXY_VERSION}-ubi8 $REGISTRY_HOST/dev/tm1proxy:${TM1PROXY_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/palm-service:${PALM_SERVICE_VERSION}-ubi8 $REGISTRY_HOST/dev/palm-service:${PALM_SERVICE_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/neo-provision:${NEO_PROVISION_VERSION}-ubi8 $REGISTRY_HOST/dev/neo-provision:${NEO_PROVISION_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/prism-app:${PRISM_APP_VERSION}-ubi8 $REGISTRY_HOST/dev/prism-app:${PRISM_APP_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/user-admin:${USER_ADMIN_VERSION}-ubi8 $REGISTRY_HOST/dev/user-admin:${USER_ADMIN_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/monitor:${MONITOR_VERSION}-ubi8 $REGISTRY_HOST/dev/monitor:${MONITOR_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/prism-platform:${PRISM_PLATFORM_VERSION}-ubi8 $REGISTRY_HOST/dev/prism-platform:${PRISM_PLATFORM_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/atlas-service:${ATLAS_SERVICE_VERSION}-ubi8 $REGISTRY_HOST/dev/atlas-service:${ATLAS_SERVICE_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/admintool:${ADMINTOOL_VERSION}-ubi8 $REGISTRY_HOST/dev/admintool:${ADMINTOOL_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/pa-content-service:${PA_CONTENT_SERVICE_VERSION}-ubi8 $REGISTRY_HOST/dev/pa-content-service:${PA_CONTENT_SERVICE_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/couchdb:${COUCHDB_VERSION}-ubi8 $REGISTRY_HOST/dev/couchdb:${COUCHDB_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/bss-init:${BSS_INIT_VERSION}-ubi8 $REGISTRY_HOST/dev/bss-init:${BSS_INIT_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/neo-idviz:${NEO_IDVIZ_VERSION}-ubi8 $REGISTRY_HOST/dev/neo-idviz:${NEO_IDVIZ_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/redis:${REDIS_VERSION}-ubi8 $REGISTRY_HOST/dev/redis:${REDIS_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/ibm-java8:${IBM_JAVA8_VERSION}-ubi8 $REGISTRY_HOST/dev/ibm-java8:${IBM_JAVA8_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/mongo:${MONGO_VERSION}-ubi8 $REGISTRY_HOST/dev/mongo:${MONGO_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/share-platform:${SHARE_PLATFORM_VERSION}-ubi8 $REGISTRY_HOST/dev/share-platform:${SHARE_PLATFORM_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/mysql-cluster:${MYSQL_CLUSTER_VERSION}-ubi8 $REGISTRY_HOST/dev/mysql-cluster:${MYSQL_CLUSTER_VERSION}-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/k8s-config:${K8S_CONFIG_VERSION}-ubi8 $REGISTRY_HOST/dev/k8s-config:${K8S_CONFIG_VERSION}-ubi8

sudo podman push $REGISTRY_HOST/dev/pa-glass:${GLASS_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/pa-cdn:${CDN_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/pa-plan-service:${PA_PLAN_SERVICE_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/pa-predict-svc:${PA_PREDICT_SVC_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/async-service:${ASYNC_SERVICE_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/paw-ui-api:${PAW_UI_API_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/prism-proxy:${PRISM_PROXY_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/share-app:${SHARE_APP_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/share-proxy:${SHARE_PROXY_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/pa-gateway:${PA_GATEWAY_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/bss:${BSS_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/wa-proxy:${WA_PROXY_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/tm1proxy:${TM1PROXY_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/palm-service:${PALM_SERVICE_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/neo-provision:${NEO_PROVISION_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/prism-app:${PRISM_APP_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/user-admin:${USER_ADMIN_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/monitor:${MONITOR_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/prism-platform:${PRISM_PLATFORM_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/atlas-service:${ATLAS_SERVICE_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/admintool:${ADMINTOOL_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/pa-content-service:${PA_CONTENT_SERVICE_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/couchdb:${COUCHDB_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/bss-init:${BSS_INIT_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/neo-idviz:${NEO_IDVIZ_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/redis:${REDIS_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/ibm-java8:${IBM_JAVA8_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/mongo:${MONGO_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/share-platform:${SHARE_PLATFORM_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/mysql-cluster:${MYSQL_CLUSTER_VERSION}-ubi8
sudo podman push $REGISTRY_HOST/dev/k8s-config:${K8S_CONFIG_VERSION}-ubi8
