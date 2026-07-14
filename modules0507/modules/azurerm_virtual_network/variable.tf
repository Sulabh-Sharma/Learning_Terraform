variable "vnetworks" {
  type = map(object({
    name                = string
    location            = string
    address_space       = list(string)
    resource_group_name = string
  }))
}