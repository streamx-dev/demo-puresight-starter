INGESTION_URL="http://localhost"
PRODUCT_ID=${1:-B071FMSYNH}
PRICE=${2:-2559}

curl -o - -X POST "${INGESTION_URL}/ingestion/v1/channels/data/messages" \
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
