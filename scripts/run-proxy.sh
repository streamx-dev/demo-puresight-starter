#!/bin/bash
docker rm nginx-proxy

echo "The following URLs are available:"
echo " - http://puresight.127.0.0.1.nip.io"
echo " - http://pim.127.0.0.1.nip.io"
echo " - http://cms.127.0.0.1.nip.io"
echo " - http://ingestion.127.0.0.1.nip.io"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
docker run --name nginx-proxy -p 80:80 -v "${SCRIPT_DIR}/proxy.conf:/etc/nginx/nginx.conf:ro" nginx:1.26.0


