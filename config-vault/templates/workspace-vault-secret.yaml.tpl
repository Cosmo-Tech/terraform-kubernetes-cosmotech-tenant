apiVersion: secrets.hashicorp.com/v1beta1
kind: VaultStaticSecret
metadata:
  name: ${namespace}-workspace-secrets
  namespace: ${namespace}
spec:
  vaultAuthRef: ${namespace}-vault-auth
  mount: ${organization}
  type: kv-v2
  path: ${tenant_id}/${cluster_name}/${namespace}/workspaces/${workspace_key}
  refreshAfter: 10s
  destination:
    create: true
    name: ${workspace_key}