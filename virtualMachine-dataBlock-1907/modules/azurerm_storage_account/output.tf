output "storage_account_details" {
  value = { for st_key, st in azurerm_storage_account.dev-storageAcc : st_key => {
    id   = st.id
    name = st.name
  } }
}