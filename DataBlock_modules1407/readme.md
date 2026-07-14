# Automated Azure Network Infrastructure via Terraform Data Blocks

A modular and highly configurable Terraform implementation engineered to deploy robust Azure networking environments. This configuration showcases advanced Infrastructure as Code (IaC) architectures by cleanly decoupling resource definition from structural provisioning through the strategic application of Terraform **Data Blocks**, **Dynamic Expressions**, and **Structural Input Validation**.

By isolating configuration attributes into distinct environmental maps, this layout decouples module architecture from environment declarations (e.g., `dev`, `prod`), preventing resource pollution while ensuring linear, reproducible deployments.

---

## 🏗️ Architectural Topology

The architecture provisions a standard high-availability multi-tier network fabric inside Azure, mapped dynamically using local loop variables.

```
                  +---------------------------------------+
                  |         Azure Subscription            |
                  +---------------------------------------+
                                      |
                                      v
                  +---------------------------------------+
                  |      Resource Group (rg-dev)          |
                  +---------------------------------------+
                                      |
            +-------------------------+-------------------------+
            |                                                   |
            v                                                   v
+-----------------------+                           +-----------------------+
| Virtual Network (VNet)|                           |   Public IP (PIP)     |
|   10.0.0.0/16         |                           |  Static / Standard    |
+-----------------------+                           +-----------------------+
            |                                                   |
            v                                                   |
+-----------------------+                                       |
|    Subnet Split       |                                       |
|  - frontend (10.0.1/24)                                       |
|  - backend  (10.0.2/24)                                       |
+-----------------------+                                       |
            |                                                   |
            +-------------------------+-------------------------+
                                      |
                                      v
                        +---------------------------+
                        |  Network Interface (NIC)  |
                        |   - Dynamic IP Mapping    |
                        |   - PIP Association       |
                        +---------------------------+
```

### Components Deployed
1. **Resource Group (`azurerm_resource_group`)**: Acts as the logical lifecycle boundary for all interconnected network elements.
2. **Virtual Network (`azurerm_virtual_network`)**: Provisions the primary address space (`10.0.0.0/16`) for isolation.
3. **Subnets (`azurerm_subnet`)**: Micro-segmented spaces split into discrete tiers (`frontend` and `backend`) using address prefixes.
4. **Public IP Address (`azurerm_public_ip`)**: Allocates internet-facing entry points matching `Standard` SKU and `Static` allocation configurations to support public ingress traffic safely.
5. **Network Interfaces (`azurerm_network_interface`)**: Binds specific subnets to compute layers, combining private allocation logic alongside optional public endpoint routing.

---

## 🛠️ The Power of Data Blocks in This Configuration

Unlike hardcoded resource maps that mandate resources are created in the same execution run, this repository utilizes **Terraform Data Blocks (`data` sources)**.

### Why Data Blocks?
* **Decoupled Lifecycles**: Allows the network layer to be read downstream by separate computing repos (like independent AKS, VM, or App Service repositories) without risking structural modifications to the primary network.
* **State Isolation**: Minimizes Blast Radius. If a compute block fails, the base networking stack remains completely untouched and isolated.
* **Multi-Environment Discovery**: Queries real-time infrastructure values from Azure at the plan stage rather than relying strictly on locally cached state parameters.

### Implementation Pattern Example
Instead of linking modules directly via resource outputs, this module reads verified structural infrastructure directly from the Azure Fabric APIs:

```hcl
# Consuming an existing Resource Group via Data Query
data "azurerm_resource_group" "network_rg" {
  name = var.resource_group_name
}

# Dynamically binding downstream subnets via Data Queries
data "azurerm_subnet" "target" {
  name                 = "frontend-subnet"
  virtual_network_name = var.vnet_name
  resource_group_name  = data.azurerm_resource_group.network_rg.name
}
```

---

## 🗂️ Project Directory Structures

The workspace uses an enterprise-grade hierarchical design separating foundational code definitions (`modules/`) from operational environment states (`Environments/`):

```text
DataBlock_modules1407/
├── Environments/
│   └── dev/
│       ├── main.tf          # Root orchestrator executing local modules
│       ├── variables.tf     # Variable schema for dev environment
│       ├── terraform.tfvars # True secret/non-secret values (Git Ignored)
│       └── backend.tf       # Azure Blob remote state engine
└── modules/
    ├── azurerm_resource_group/
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variable.tf
    ├── azurerm_virtual_network/
    │   ├── main.tf
    │   └── variable.tf
    ├── azurerm_subnet/
    │   ├── main.tf
    │   └── variable.tf
    └── azurerm_nic/
        ├── main.tf
        └── variable.tf
```

---

## ⚙️ HCL Input Implementations & Variable Layouts

### Environment Execution Block (`Environments/dev/main.tf`)
The root module orchestrates structural deployment by looping maps inside variable arguments:

```hcl
module "resource_group" {
  source   = "../../modules/azurerm_resource_group"
  rg_name  = var.dev_rg_name
  location = var.dev_location
}

module "virtual_network" {
  source              = "../../modules/azurerm_virtual_network"
  vnet_name           = "vnet-fabric-dev"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
}

module "nic" {
  source              = "../../modules/azurerm_nic"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  nic_instances = {
    nic1 = {
      name                          = "frontend-nic-dev"
      subnet_id                     = module.subnet.subnet_ids["frontend"]
      private_ip_allocation_method = "Dynamic"
    },
    nic2 = {
      name                          = "backend-nic-dev"
      subnet_id                     = module.subnet.subnet_ids["backend"]
      private_ip_allocation_method = "Dynamic"
    }
  }
}
```

### Module Schema Customization with Optional Types (`modules/azurerm_nic/variable.tf`)
To circumvent common initialization roadblocks, structural map attributes are marked `optional()` to ensure flexibility for both minimal and hyper-specific deployment profiles:

```hcl
variable "nic_instances" {
  type = map(object({
    name                          = string
    subnet_id                     = string
    private_ip_allocation_method = string
    private_ip_address            = optional(string, null) # Gracefully permits omissions
    public_ip_address_id          = optional(string, null) # Avoids 'attribute required' crashes
  }))
  description = "A configuration map defining structural properties for NIC deployment tiers."
}
```

---

## 🚀 Deployment Guide & Verification Workflows

Follow these sequential steps to initialize, validate, and apply the modular network fabric:

### 1. Environment Authentication
Ensure your local terminal context is authenticated against the proper active target Azure Subscription before running initialization hooks:

```powershell
# Authenticate to Azure CLI
az login

# Set active subscription target context
az account set --subscription "3e2f11dd-62bf-450c-bf03-201403d7d76f"
```

### 2. Workspace Optimization & Staging Clean
Ensure all legacy embedded git configuration elements or corrupt state initializations are purged locally:

```powershell
# Purge broken local provider cache objects
Remove-Item -Recurse -Force .terraform/
Remove-Item -Force .terraform.lock.hcl
```

### 3. Initialize the Terraform State Engine
Execute the compilation engine to load module structural contexts and provider bindings:

```powershell
terraform init
```

### 4. Code Validation & Compilation Checks
Verify structural format validity and compliance parameters before updating remote systems:

```powershell
terraform validate
```

### 5. Generate Execution Plan
Verify the generated graph layout matches architectural specs:

```powershell
terraform plan -out=tfplan
```

### 6. Apply Network Provisioning
Execute the dry-run compilation plan directly to deploy the active configuration inside Azure:

```powershell
terraform apply tfplan
```

---

## 💡 Engineering Best Practices & Lessons Learned

### 1. Azure Naming Conventions inside Blob State Backends
When migrating local runtime execution states onto remote `azurerm` container instances, name formatting must stringently follow Azure naming principles:
* **Only use lowercase alphanumeric elements and absolute hyphens (`-`).**
* Blatantly avoiding underscores (`_`) or capitalization avoids runtime initialization failures (`400 Bad Request / InvalidResourceName`).

### 2. Guardrails with `optional()` Object Variables
Leveraging strict `map(object({}))` schemas without specifying fallback definitions triggers compiler constraints if attributes are missing (`attribute "container_name" is required`). Wrapping nested structural objects within `optional(type, default)` structures guarantees backward compatibility across multi-tier modules.

### 3. Implicit vs Explicit Graph Dependencies
Rely on implicit path assignments (e.g., passing `module.resource_group.name` downstream) wherever possible to allow concurrent thread operations. Reserve explicit `depends_on` hooks exclusively for asynchronous background activities (such as Azure RBAC Propagation or Key Vault Access Policies) to optimize deployment velocity.
