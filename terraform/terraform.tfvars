location            = "australiasoutheast"

# acr_name, storage_account_name, and aks_cluster_name are intentionally
# NOT set here. They are supplied at runtime via TF_VAR_* environment
# variables sourced from GitHub Actions repository variables
# (ACR_NAME, STORAGE_ACCOUNT_NAME, AKS_CLUSTER_NAME), so real Azure
# resource identifiers never need to be committed to source control.

aks_dns_prefix   = "koalatech"

aks_node_count   = 3
aks_node_vm_size = "Standard_D2s_v3"

environment = "development"

tags = {
  Project     = "KoalaTech Course Platform"
  ManagedBy   = "Terraform"
  Practical   = "Week08"
  Environment = "Development"
}