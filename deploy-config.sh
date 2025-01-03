# ConfigMaps for directories
kubectl create configmap sx-extcfg-opensearch-service-init --from-file=configs/opensearch/service-init
kubectl label configmap sx-extcfg-opensearch-service-init mesh.streamx.dev/config-type=dir
kubectl label configmap sx-extcfg-opensearch-service-init app.kubernetes.io/part-of=sx
kubectl label configmap sx-extcfg-opensearch-service-init app.kubernetes.io/component=external-config


# ConfigMaps for properties
kubectl create configmap sx-extcfg-nginx-conf-demo-conf --from-file=configs/nginx_conf/demo.conf
kubectl label configmap sx-extcfg-nginx-conf-demo-conf mesh.streamx.dev/config-type=file
kubectl label configmap sx-extcfg-nginx-conf-demo-conf app.kubernetes.io/part-of=sx
kubectl label configmap sx-extcfg-nginx-conf-demo-conf app.kubernetes.io/component=external-config

kubectl create configmap sx-extcfg-aggregator-properties --from-env-file=configs/aggregator.properties
kubectl label configmap sx-extcfg-aggregator-properties mesh.streamx.dev/config-type=file
kubectl label configmap sx-extcfg-aggregator-properties app.kubernetes.io/part-of=sx
kubectl label configmap sx-extcfg-aggregator-properties app.kubernetes.io/component=external-config

kubectl create configmap sx-extcfg-data-collector-properties --from-env-file=configs/data-collector.properties
kubectl label configmap sx-extcfg-data-collector-properties mesh.streamx.dev/config-type=file
kubectl label configmap sx-extcfg-data-collector-properties app.kubernetes.io/part-of=sx
kubectl label configmap sx-extcfg-data-collector-properties app.kubernetes.io/component=external-config

kubectl create configmap sx-extcfg-image-optimization-properties --from-env-file=configs/image-optimization.properties
kubectl label configmap sx-extcfg-image-optimization-properties mesh.streamx.dev/config-type=file
kubectl label configmap sx-extcfg-image-optimization-properties app.kubernetes.io/part-of=sx
kubectl label configmap sx-extcfg-image-optimization-properties app.kubernetes.io/component=external-config

kubectl create configmap sx-extcfg-ingestion-properties --from-env-file=configs/ingestion.properties
kubectl label configmap sx-extcfg-ingestion-properties mesh.streamx.dev/config-type=file
kubectl label configmap sx-extcfg-ingestion-properties app.kubernetes.io/part-of=sx
kubectl label configmap sx-extcfg-ingestion-properties app.kubernetes.io/component=external-config

kubectl create configmap sx-extcfg-image-optimization-properties --from-env-file=configs/image-optimization.properties
kubectl label configmap sx-extcfg-image-optimization-properties  mesh.streamx.dev/config-type=file
kubectl label configmap sx-extcfg-image-optimization-properties  app.kubernetes.io/part-of=sx
kubectl label configmap sx-extcfg-image-optimization-properties  app.kubernetes.io/component=external-config

kubectl create configmap sx-extcfg-aggregator-properties --from-env-file=configs/aggregator.properties
kubectl label configmap sx-extcfg-aggregator-properties  mesh.streamx.dev/config-type=file
kubectl label configmap sx-extcfg-aggregator-properties  app.kubernetes.io/part-of=sx
kubectl label configmap sx-extcfg-aggregator-properties  app.kubernetes.io/component=external-config

# Secrets for properties
kubectl create secret generic sx-extsec-opensearch-component-secrets-properties --from-env-file=secrets/opensearch-component-secrets.properties
kubectl label secret sx-extsec-opensearch-component-secrets-properties mesh.streamx.dev/config-type=file
kubectl label secret sx-extsec-opensearch-component-secrets-properties app.kubernetes.io/part-of=sx
kubectl label secret sx-extsec-opensearch-component-secrets-properties app.kubernetes.io/component=external-secret

kubectl create secret generic sx-extsec-opensearch-secrets-properties --from-env-file=secrets/opensearch-secrets.properties
kubectl label secret sx-extsec-opensearch-secrets-properties mesh.streamx.dev/config-type=file
kubectl label secret sx-extsec-opensearch-secrets-properties app.kubernetes.io/part-of=sx
kubectl label secret sx-extsec-opensearch-secrets-properties app.kubernetes.io/component=external-secret

