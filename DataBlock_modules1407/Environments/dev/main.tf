module "resource_groups" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}

# module "storage_account" {
#     depends_on = [ module.resource_groups ]
#     source = "../../modules/azurerm_storage_account"
#     storageAcc = var.storageAcc
# }

module "virtual_networks" {
  depends_on = [module.resource_groups]
  source     = "../../modules/azurerm_virtual_network"
  vnetworks  = var.vnetworks
}

module "subnets" {
  depends_on = [module.virtual_networks]
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
}

module "pip" {
  depends_on = [module.resource_groups]
  source     = "../../modules/azurerm_public_ip"
  pips       = var.pips
}

module "nic" {
  depends_on = [module.subnets, module.pip]
  source     = "../../modules/azurerm_nic"
  nics       = var.nics
}

# module "bastion" {
#     depends_on = [ module.resource_groups,module.virtual_networks,module.subnets,module.pip ]
#   source   = "../../modules/azurerm_bastion"
#   bastions = var.bastions
# }
