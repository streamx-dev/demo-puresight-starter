namespace=${1:-default}
mesh_custom_resource=$(cat <<EOF
apiVersion: "streamx.dev/v1alpha1"
kind: ServiceMesh
metadata:
  name: sx
spec: {}
EOF
)

merged_mesh=$(yq eval ' .spec = load("mesh.yaml") | .spec.deploymentConfig = load("deployment.yaml")' <<< "$mesh_custom_resource")

echo "$merged_mesh" | kubectl apply -n "$namespace" -f -