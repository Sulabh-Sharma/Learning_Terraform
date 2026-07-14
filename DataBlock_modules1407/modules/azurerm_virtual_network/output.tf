output "vnetworks" {
    value = { for vnet_key,vnet in azurerm_virtual_network.vnet-networking : vnet_key => {
        id = vnet.id
        name = vnet.name
    }}
}