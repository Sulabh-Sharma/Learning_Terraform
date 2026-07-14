output "rg-dev-networking" {
  value = { for rg_key, rg in azurerm_resource_group.rg-networking : rg_key => {
    id   = rg.id
    name = rg.name
  } }
}