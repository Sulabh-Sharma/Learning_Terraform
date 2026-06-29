# Terraform Practice Repository

## 📖 Overview

Welcome to my **Terraform Practice Repository**.

This repository is dedicated to learning and practicing **Terraform** by building Infrastructure as Code (IaC) projects. It contains Terraform configuration files, reusable modules, and hands-on examples while following Terraform best practices and industry standards.

The primary goal of this repository is to gain practical experience with Terraform, understand modular infrastructure design, and build reusable, scalable, and maintainable infrastructure.

---

## 🎯 Objectives

* Learn Terraform fundamentals
* Practice writing Terraform configuration files
* Create reusable Terraform modules
* Understand Infrastructure as Code (IaC)
* Follow Terraform best practices
* Manage infrastructure efficiently
* Experiment with different cloud resources

---

## 📂 Repository Structure

```text
terraform-practice/
│
├── modules/                # Reusable Terraform modules
│
├── examples/               # Example implementations
│
├── environments/           # Environment-specific configurations
│   ├── dev/
│   ├── test/
│   └── prod/
│
├── main.tf                 # Main Terraform configuration
├── variables.tf            # Input variables
├── outputs.tf              # Output values
├── provider.tf             # Provider configuration
├── terraform.tfvars        # Variable values (ignored if sensitive)
├── versions.tf             # Terraform & provider versions
└── README.md
```

---

## 🛠 Technologies

* Terraform
* Infrastructure as Code (IaC)
* Cloud Providers (Azure, AWS, or GCP)
* Git & GitHub

---

## 🚀 Topics Covered

* Providers
* Resources
* Variables
* Outputs
* Data Sources
* Local Values
* Modules
* State Management
* Backend Configuration
* Workspaces
* Provisioners
* Remote State
* Lifecycle Rules
* Dependencies
* Dynamic Blocks
* Functions
* Expressions
* Best Practices

---

## ▶️ Getting Started

### Initialize Terraform

```bash
terraform init
```

### Validate Configuration

```bash
terraform validate
```

### Format Code

```bash
terraform fmt
```

### Preview Changes

```bash
terraform plan
```

### Apply Infrastructure

```bash
terraform apply
```

### Destroy Infrastructure

```bash
terraform destroy
```

---

## 📚 Learning Goals

* Build reusable modules
* Improve Terraform project structure
* Learn production-ready practices
* Write clean and maintainable code
* Understand state management
* Explore advanced Terraform features

---

## ⚠️ Note

This repository is intended for learning and experimentation. Infrastructure and configurations may change frequently as new concepts are explored.

---

## 📄 License

This project is open for learning and educational purposes.
