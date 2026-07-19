# Azure Virtual Machine Deployment using Terraform Modules

This repository demonstrates how to provision an **Azure Virtual Machine** on **Microsoft Azure** using **Terraform Modules**. The project follows a modular architecture with separate environment configurations for **Development**, **QA**, and **Production**, making the infrastructure reusable, scalable, and easy to manage.

## 📂 Project Structure

```text
VIRTUALMACHINE-DATABLOCK-1907/
│
├── Environments/
│   ├── dev/
│   ├── qa/
│   └── prod/
│
├── modules/
│   ├── azurerm_resource_group/
│   ├── azurerm_virtual_network/
│   ├── azurerm_subnet/
│   ├── azurerm_nsg/
│   ├── azurerm_public_ip/
│   ├── azurerm_nic/
│   ├── azurerm_virtual_machine/
│   ├── azurerm_storage_account/
│   ├── azurerm_bastion/
│   └── azurerm_vnet_peering/
│
├── .gitignore
└── README.md
```

## 🚀 Resources Deployed

- Resource Group
- Virtual Network (VNet)
- Subnet
- Network Security Group (NSG)
- Public IP
- Network Interface (NIC)
- Azure Virtual Machine
- Azure Bastion
- Storage Account
- Virtual Network Peering

## 🛠️ Technologies Used

- Terraform
- Microsoft Azure
- Git & GitHub
- Visual Studio Code

## ▶️ Deployment

```bash
cd Environments/dev

terraform init
terraform validate
terraform plan
terraform apply
```

## 📌 Project Highlights

- Modular Terraform Architecture
- Multi-Environment Support (Dev, QA, Prod)
- Reusable Terraform Modules
- Azure Virtual Machine Deployment
- Scalable Infrastructure as Code (IaC)
- Production-Oriented Folder Structure

## 🎯 Objective

The objective of this project is to deploy an Azure Virtual Machine using reusable Terraform modules while following Infrastructure as Code (IaC) best practices and supporting multiple deployment environments.

---
⭐ This repository is part of my Terraform learning journey for building production-ready Azure infrastructure.