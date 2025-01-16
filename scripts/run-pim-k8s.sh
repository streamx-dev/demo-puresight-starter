STREAMX_TOKEN=$(kubectl get secrets sx-sec-auth-jwt-pim -o jsonpath  -o jsonpath="{.data.jwt}" | base64 --decode)

IMAGE=ghcr.io/streamx-dev/demo-puresight-pim/puresight-pim:0.0.6-jvm
docker pull ${IMAGE}
# Remove the old instance
docker rm streamx-demo-sandbox-pim
docker run --name streamx-demo-sandbox-pim \
  --add-host=host.docker.internal:host-gateway \
  -p 9000:8080 \
  -e STREAMX_URL=http://ingestion.20.126.186.199.nip.io \
  -e STREAMX_TOKEN="$STREAMX_TOKEN" \
  -e QUARKUS_HTTP_AUTH_FORM_TIMEOUT=PT1M \
  ${IMAGE}
