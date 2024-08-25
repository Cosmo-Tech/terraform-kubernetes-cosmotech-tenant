
resource "kubernetes_config_map" "vault_config_script" {
  metadata {
    name      = "vault-config-script"
    namespace = var.vault_namespace
  }

  data = {
    "configure-vault.sh" = templatefile("${path.module}/templates/configure-vault.sh.tpl", {
      allowed_namespace                = var.allowed_namespace
      VAULT_NAMESPACE                  = var.vault_namespace
      VAULT_SECRETS_OPERATOR_NAMESPACE = var.vault_sops_namespace
      tenant_id                        = var.tenant_id
      cluster_name                     = var.cluster_name
      organization                     = var.organization
    })
  }
}

resource "kubernetes_job" "vault_config" {
  metadata {
    name      = "vault-config-job"
    namespace = var.vault_namespace
  }

  spec {
    template {
      metadata {
        name = "vault-config"
      }

      spec {
        restart_policy       = "Never"
        service_account_name = "vault-unseal"
        container {
          name    = "vault-config"
          image   = "bitnami/kubectl:latest"
          command = ["/bin/bash", "-c", "bash /scripts/configure-vault.sh"]

          env {
            name  = "VAULT_ADDR"
            value = var.vault_address
          }

          env {
            name  = "VAULT_NAMESPACE"
            value = var.vault_namespace
          }

          volume_mount {
            name       = "config"
            mount_path = "/scripts"
          }
        }

        volume {
          name = "config"
          config_map {
            name = kubernetes_config_map.vault_config_script.metadata[0].name
          }
        }
      }
    }

    backoff_limit = 4
  }

  wait_for_completion = true
  timeouts {
    create = "5m"
    update = "5m"
  }

  depends_on = [
    kubernetes_config_map.vault_config_script
  ]
}

resource "kubectl_manifest" "namespace_vault_auth" {
  validate_schema = false
  yaml_body = templatefile("${path.module}/templates/vault-auth.yaml.tpl", {
    allowed_namespace = var.allowed_namespace
  })

  depends_on = [
    kubernetes_job.vault_config
  ]
}

resource "kubectl_manifest" "platform_vault_secret" {
  validate_schema = false
  yaml_body = templatefile("${path.module}/templates/platform-vault-secret.yaml.tpl", {
    allowed_namespace = var.allowed_namespace,
    tenant_id         = var.tenant_id,
    cluster_name      = var.cluster_name,
    organization      = var.organization
  })

  depends_on = [
    kubernetes_job.vault_config,
    kubectl_manifest.namespace_vault_auth
  ]
}
