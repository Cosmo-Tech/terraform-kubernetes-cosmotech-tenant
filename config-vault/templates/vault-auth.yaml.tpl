apiVersion: secrets.hashicorp.com/v1beta1
kind: VaultAuth
metadata:
  name: ${allowed_namespace}-static-auth
  namespace: ${allowed_namespace}
spec:
  method: kubernetes
  mount: kubernetes
  kubernetes:
    role: ${allowed_namespace}-role
    serviceAccount: default
    audiences:
      - vault