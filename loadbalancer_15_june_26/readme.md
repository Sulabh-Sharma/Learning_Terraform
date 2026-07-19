# Azure Load Balancer using Terraform

This repository demonstrates how to provision an **Azure Load Balancer** using **Terraform**. Unlike my modular projects, this implementation uses a **single Terraform configuration** to understand the fundamentals of deploying Azure networking resources.

## 📂 Project Structure

```text
loadbalancer_15_june/
│
├── main.tf
├── provider.tf
├── variable.tf
├── .terraform.lock.hcl
├── .gitignore
└── README.md
```

## 🚀 What I Practiced

- Azure Load Balancer
- Backend Address Pool
- Health Probe
- Load Balancing Rule
- Public IP Association
- Virtual Machine Traffic Distribution
- Terraform Basics

## 🛠️ Technologies

- Terraform
- Microsoft Azure
- Git & GitHub
- Visual Studio Code

## ▶️ Usage

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

## 📌 Objective

Learn how to deploy and configure an Azure Load Balancer using Terraform by creating all required resources in a single configuration file without using modules.

---
⭐ This repository is part of my Terraform learning journey on Microsoft Azure.
