namespace=${1:-default}
mesh=$(cat <<EOF
apiVersion: "streamx.dev/v1alpha1"
kind: ServiceMesh
metadata:
  name: sx
spec: {}
EOF
)


echo "$mesh" | kubectl delete -n "$namespace" -f -