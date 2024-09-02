apiVersion: secrets.hashicorp.com/v1beta1
kind: VaultStaticSecret
metadata:
  name: ${allowed_namespace}-platform-secrets
  namespace: ${allowed_namespace}
spec:
  vaultAuthRef: ${allowed_namespace}-static-auth
  mount: ${organization}
  type: kv-v2
  path: ${tenant_id}/${cluster_name}/${allowed_namespace}-platform-secrets
  refreshAfter: 10s
  destination:
    create: true
    name: ${allowed_namespace}-platform-secrets