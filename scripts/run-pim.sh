IMAGE=ghcr.io/streamx-dev/demo-puresight-pim/puresight-pim:0.0.6-jvm
docker pull ${IMAGE}
# Remove the old instance
docker rm streamx-demo-sandbox-pim
docker run --name streamx-demo-sandbox-pim \
  -p 9000:8080 \
  -e STREAMX_URL=http://host.docker.internal:8080 \
  -e QUARKUS_HTTP_AUTH_FORM_TIMEOUT=PT1M \
  ${IMAGE}
