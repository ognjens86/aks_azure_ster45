# Fetch the Service Principal
data "azurerm_service_principal" "ognjen" {
  display_name = "ognjen-service-principal"
}

# Create Federated Identity Credential
resource "azurerm_federated_identity_credential" "dev_test" {
  name                = "dev-test"
  resource_group_name = local.resource_group_name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = azurerm_kubernetes_cluster.this.oidc_issuer_url
  parent_id           = data.azurerm_service_principal.ognjen.id  # Use the service principal ID
  subject             = "system:serviceaccount:dev:my-account"

  depends_on = [azurerm_kubernetes_cluster.this]
}

