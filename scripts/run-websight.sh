IMAGE=europe-west1-docker.pkg.dev/websight-io/websight-docker-releases/websight-cms-starter:1.25.2
docker pull ${IMAGE}
# Remove the old instance
docker rm streamx-demo-sandbox-websight-cms
MESH_NETWORK=$(docker inspect rest-ingestion --format '{{range .NetworkSettings.Networks}}{{.NetworkID}}{{end}}')
docker run --name streamx-demo-sandbox-websight-cms \
  --network "${MESH_NETWORK}" \
  -p 9001:8080 \
  -p 5009:5009 \
  -e JAVA_DEBUG_PORT=5009 \
  -e STREAMX_PUBLICATION_ENABLE=true \
  -e PURESIGHT_STREAMX_REST_INGESTION_HOST=http://rest-ingestion:8080 \
  ${IMAGE}
