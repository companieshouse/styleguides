# Terraform Coding Standards

## Overview

Terraform is the default tool used for provisioning cloud infrastructure. This guide defines the coding standards and best practices for writing and maintaining Terraform scripts.

---

## Versions

- The currently supported version of Terraform is:  

   ```terraform
   0.12
   ```

---

## Formatting and Style

### Indentation and Spacing

- Use **2 spaces** for indentation (not tabs).
- Consistent spacing aids readability and code consistency.

### Alignment

- Ensure all code is **correctly and consistently aligned** for better legibility.

### Naming Conventions

- Use **snake_case** for all element names to avoid Terraform warnings:
  - ✅ `my_resource`  
    - ❌ `my-resource`  

---

## Modules

### Module Structure

- When your scripts are sufficiently large, use modules to promote reusability and maintainability.
- Each module should reside in its own directory, following the naming convention:  

   ```plaintext
   module-<FUNCTION>
   ```

- Example:
  - ✅ `module-security-groups`
    - ✅ `module-ec2-instances`

---

## Comments and Descriptions

### Comments

- **Minimise comments** where possible. Code should be self-explanatory.  
- Use **descriptions** instead of comments where supported, as descriptions are visible in the AWS console.

### Comment Example

```terraform
# Avoid comments like this
# This security group allows SSH access
resource "aws_security_group" "ssh" {
  description = "Allows SSH access"
  ...
}
```

---

## Resources

### Resource Naming

- Use **snake_case** for all resource names:
  - ✅ `my_instance`
    - ❌ `my-instance`
- This prevents Terraform warnings and maintains consistency.

---

## Data Sources

### Usage

- Use **data sources** to look up external data or resources defined in separate Terraform configurations.
- Examples include:
  - Data held in **HashiCorp Vault**
    - Infrastructure resources like **subnet CIDRs** or **VPC IDs**

### Naming

- Use **snake_case** for data source names:
  - ✅ `my_data`
    - ❌ `my-data`

### Remote State

- **Avoid using Terraform Remote State** for data lookups.  
- Review and remove any instances of:  

   ```terraform
   terraform_remote_state
   ```

---

## Variables

### Naming Variables

- Use **meaningful and contextual variable names**.  
- Reflect the data being passed:
  - ✅ `web_cidrs` → (list of CIDRs for web servers)  
    - ❌ `my_subnet_cidrs` → (too vague)  

- Use **plural names** for lists and singular names for single values:
  - ✅ `server_ids` → List of server IDs  
    - ✅ `db_password` → Single password string  

### Descriptions

- Omit descriptions if the variable name is clear.  
- Add descriptions for ambiguous or complex variables.

### Type Declaration

- **Always specify the type** to prevent ambiguity and ensure robust code.

### Example

```terraform
variable "web_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for web access"
}
```

---

## Value Assignment

### Methods

- Assign variable values using:
  - **Environment vars**
    - **Defaults**
    - **Locals blocks**

### Guidance

#### Defaults

- Use default values when they apply across multiple environments.  
- Avoid duplicating values across environments.

#### Environment Vars

- Set environment-specific variables here.

#### Local Vars

- Use `locals` to avoid repeating constants inside a module.
- Group related local variables for readability.

### Example with Vault-Sourced Secrets

```terraform
locals {
  internal_cidrs = values(data.vault_generic_secret.internal_cidrs.data)
}
```

- Use `local.internal_cidrs` throughout the module instead of the full `data.vault_generic_secret...` path for clarity.

---

## Security

- **Never commit sensitive values** (e.g., passwords, secrets) to source control.  
- Use tools like **HashiCorp Vault** or AWS Secrets Manager for secrets management.
- Even infrastructure details (e.g., CIDRs) should be handled carefully, as repositories can become public.

---

## Grouping Variables

- Group related variables together under comments for readability. Include their type, description and default value.

### Grouping Example

```terraform
# DNS
variable "zone_id" {
  type        = string
  description = "The ID of the DNS zone"
  default     = "Z1234567890ABC"
}

# EC2
variable "ec2_instance_type" {
  type        = string
  description = "The instance type for EC2"
  default     = "t2.micro" 
}
```

---

## READMEs

### Documentation Standards

- All scripts should include a **README** with:
  - **Purpose** of the script
    - List of variables with descriptions
    - Example usage  

### Module-Specific Documentation

- When using modules:
  - Each module must include its own `README.md` for detailed documentation.  
    - The **root README** should link to individual module READMEs.

### Example README Structure

```terraform
# VPC Provisioning

## Overview
This script provisions a Virtual Private Cloud (VPC) with public and private subnets in AWS using Terraform.

## Variables
- `vpc_cidr`: The CIDR block for the VPC. Example: `"10.0.0.0/16"`
- `public_subnet_cidrs`: List of CIDR blocks for the public subnets. Example: `["10.0.1.0/24"]`
- `private_subnet_cidrs`: List of CIDR blocks for the private subnets. Example: `["10.0.2.0/24"]`

## Usage
Include this code in your main Terraform configuration file to call the module and provision the VPC:

module "vpc" {
  source              = "./module-vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24"]
  private_subnet_cidrs = ["10.0.2.0/24"]
}
```
