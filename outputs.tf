# output "vm_azure_ip" {
#   value = azurerm_linux_virtual_machine.vm.public_ip_address
# }

output "subnet_id" {
  value = aws_subnet.subnet.id
}

output "security_group_id" {
  value = aws_security_group.security_group.id
}

output "vm_aws_ip" {
  value = aws_instance.vm.public_ip
}