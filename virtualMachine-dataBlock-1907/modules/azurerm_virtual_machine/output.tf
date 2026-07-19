output "virtual_machine_details" {
value = {for vm_key, vm in azurerm_virtual_machine.vm : vm_key => {
    id  = vm.id
    name = vm.name
}}  
}