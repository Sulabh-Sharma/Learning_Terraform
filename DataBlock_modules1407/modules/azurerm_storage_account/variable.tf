variable "storageAcc" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    account_tier = string
    account_replication_type = string
    container_name = string
    container_access_type = string
    storage_account_id = optional(string)
    tags = object({
          environment = string 
    })
  }))
}