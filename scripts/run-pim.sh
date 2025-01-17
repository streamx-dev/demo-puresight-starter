IMAGE=ghcr.io/streamx-dev/demo-puresight-pim/puresight-pim:0.0.6-jvm
docker pull ${IMAGE}
# Remove the old instance
docker rm streamx-demo-sandbox-pim
MESH_NETWORK=$(docker inspect rest-ingestion --format '{{range .NetworkSettings.Networks}}{{.NetworkID}}{{end}}')
docker run --name streamx-demo-sandbox-pim \
  --network "${MESH_NETWORK}" \
  -p 9000:8080 \
  -e STREAMX_URL=http://rest-ingestion:8080 \
  -e QUARKUS_HTTP_AUTH_FORM_TIMEOUT=PT1M \
  ${IMAGE}
