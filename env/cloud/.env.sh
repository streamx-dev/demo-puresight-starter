export KUBECONFIG=/Users/kamilchociej/DEV/PROJECTS/DS/terraform-helm-charts/examples/azure/env/kubeconfig
export STREAMX_TOKEN_PIM=$(kubectl get secrets sx-sec-auth-jwt-pim -o jsonpath  -o jsonpath="{.data.jwt}" | base64 --decode)
export STREAMX_TOKEN_WS=$(kubectl get secrets sx-sec-auth-jwt-websight -o jsonpath  -o jsonpath="{.data.jwt}" | base64 --decode)
# Cloud Load Balancer IP. Should be taken from StreamX Platform Terraform script 'loadbalancer_ip' output
export STREAMX_INGRESS_IP=
export STREAMX_INGESTION_URL="http://ingestion.${STREAMX_INGRESS_IP}.nip.io"