output "vnet_details" {
  value = { for peer_key, peer in azurerm_virtual_network_peering.vnet_peering : peer_key => {
    id                        = peer.id
    name                      = peer.name
    resource_group_name       = peer.resource_group_name
    virtual_network_name      = peer.virtual_network_name
    remote_virtual_network_id = peer.remote_virtual_network_id
  } }
}
