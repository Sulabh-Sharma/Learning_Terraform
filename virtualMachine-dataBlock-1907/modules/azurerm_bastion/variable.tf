variable "bastions" {
  type = map(object({
    name = string
    location = string
    resource_group_name = string
    virtual_network_name   = string
    subnet_name            = string
    public_ip_address_name = string
    ip_configuration = object({
      name = string
      subnet_id = optional(string)
      public_ip_address_id = optional(string)
    })
  }))
}