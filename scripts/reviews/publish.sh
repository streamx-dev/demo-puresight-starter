INGESTION_URL="http://localhost"
PRODUCT_ID=${1:-B071FMSYNH}

curl -o - -X POST "${INGESTION_URL}/ingestion/v1/channels/data/messages" \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer ${TOKEN}" \
  -d '{
        "key" : "review:'${PRODUCT_ID}':1",
        "action" : "publish",
        "eventTime" : null,
        "properties" : { },
        "payload" : {
          "dev.streamx.blueprints.data.Data" : {
            "content": {
              "bytes": "{\"title\": \"A Dreamy Slumber\",\"content\": \"This bed has been a game-changer for my sleep quality. The comfort level is unmatched, and it feels like I am sleeping on a cloud. I wake up refreshed and ready to tackle the day. Worth every penny!\",\"stars\": 5,\"author\": \"Sarah Johnson\",\"date\": \"July 15, 2023\"}"
            }
          }
        }
      }'

curl -o - -X POST "${INGESTION_URL}/ingestion/v1/channels/data/messages" \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer ${TOKEN}" \
  -d '{
        "key" : "review:'${PRODUCT_ID}':2",
        "action" : "publish",
        "eventTime" : null,
        "properties" : { },
        "payload" : {
          "dev.streamx.blueprints.data.Data" : {
            "content": {
              "bytes": "{\"title\": \"Cozy and Supportive\",\"content\": \"The bed provides a cozy nest-like feeling, and the support is excellent for my back. While it is a bit pricier than I would like, the comfort it offers makes it a solid investment for a good night'\''s sleep.\",\"stars\": 4,\"author\": \"Michael Thompson\",\"date\": \"August 3, 2023\"}"
            }
          }
        }
      }'
