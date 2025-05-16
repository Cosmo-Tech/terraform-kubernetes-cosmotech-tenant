module "create-grafana-dashboard" {
  source = "./create-grafana-dashboard"

  count = var.dashboard_deploy ? 1 : 0

  namespace                = var.kubernetes_tenant_namespace
  redis_port               = var.redis_port
  redis_auth_user          = var.dashboard_redis_auth_user
  redis_auth_password      = var.redis_admin_password
  postgresql_port          = var.postgresql_port
  postgresql_auth_user     = var.postgresql_auth_user
  postgresql_auth_password = var.postgresql_auth_password
  postgresql_db            = var.postgresql_db
}
