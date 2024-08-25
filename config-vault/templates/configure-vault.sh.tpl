#!/bin/bash

echo "Starting Vault configuration script"

# Fonction pour exécuter des commandes Vault
vault_cmd() {
  kubectl -n $VAULT_NAMESPACE exec -i vault-0 -- vault "$@"
}

# Attendre que Vault soit prêt
until kubectl get pods -n $VAULT_NAMESPACE | grep vault-0 | grep -q Running; do
  echo "Waiting for Vault to be ready..."
  sleep 5
done

# Vérifier si le secret engine existe, sinon le créer
if ! vault_cmd secrets list | grep -q "^${organization}/"; then
  echo "Creating ${organization} secret engine"
  vault_cmd secrets enable -path=${organization} kv-v2
else
  echo "${organization} secret engine already exists"
fi

# Créer des politiques et des rôles pour namespace
NAMESPACE_POLICY='
path "${organization}/data/${tenant_id}/clusters/${cluster_name}/${allowed_namespace}-platform-secrets" {
  capabilities = ["create", "read", "update", "patch", "delete", "list"]
}
'
echo "$NAMESPACE_POLICY" | vault_cmd policy write ${allowed_namespace}-policy -

vault_cmd auth enable kubernetes

token=$(kubectl -n $VAULT_NAMESPACE exec -i vault-0 -- cat /var/run/secrets/kubernetes.io/serviceaccount/token)

vault_cmd write auth/kubernetes/config \
  token_reviewer_jwt="$token" \
  kubernetes_host=https://10.0.0.1:443 \
  kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt \
  issuer="https://kubernetes.default.svc.cluster.local"

vault_cmd write auth/kubernetes/role/${allowed_namespace}-role \
  bound_service_account_names=default \
  bound_service_account_namespaces=${allowed_namespace} \
  policies=default,${allowed_namespace}-policy \
  audience=vault \
  ttl=24h

echo "Vault configuration completed successfully."