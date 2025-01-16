STREAMX_TOKEN=$(kubectl get secrets sx-sec-auth-jwt-websight -o jsonpath  -o jsonpath="{.data.jwt}" | base64 --decode)

INGESTION_URL="http://ingestion.20.126.186.199.nip.io"
PRODUCT_ID=${1:-B071FMSYNH}
PRICE=${2:-2559}

curl -o - -X POST "${INGESTION_URL}/ingestion/v1/channels/data/messages" \
  -H "Authorization: Bearer ${STREAMX_TOKEN}" \
  -H 'Content-Type: application/json' \
  -d '{
        "key" : "price:'${PRODUCT_ID}'",
        "action" : "publish",
        "eventTime" : null,
        "properties" : { },
        "payload" : {
          "dev.streamx.blueprints.data.Data" : {
            "content": {
              "bytes": "{ \"price\": { \"value\": \"'${PRICE}'\" } }"
            }
          }
        }
      }'
