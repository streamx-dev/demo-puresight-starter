STREAMX_TOKEN=$(kubectl get secrets sx-sec-auth-jwt-pim -o jsonpath  -o jsonpath="{.data.jwt}" | base64 --decode)

IMAGE=europe-west1-docker.pkg.dev/websight-io/websight-docker-releases/websight-cms-starter:1.25.2
docker pull ${IMAGE}
# Remove the old instance
docker rm streamx-demo-sandbox-websight-cms
docker run --name streamx-demo-sandbox-websight-cms \
  --add-host=host.docker.internal:host-gateway \
  -p 9001:8080 \
  -p 5009:5009 \
  -e JAVA_DEBUG_PORT=5009 \
  -e STREAMX_PUBLICATION_ENABLE=true \
  -e PURESIGHT_STREAMX_REST_INGESTION_HOST=http://host.docker.internal \
  ${IMAGE}
