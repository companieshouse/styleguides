# Terraform Coding Standards

## 1. Overview
Terraform is the default tool used for provisioning cloud infrastructure. This guide defines the coding standards and best practices for writing and maintaining Terraform scripts.

---

## 2. Versions
- The currently supported version of Terraform is:  
   ```terraform
   0.12
   ```

---

## 3. Formatting and Style

### 3.1 Indentation and Spacing
- Use **2 spaces** for indentation (not tabs).
- Consistent spacing aids readability and code consistency.

### 3.2 Alignment
- Ensure all code is **correctly and consistently aligned** for better legibility.

### 3.3 Naming Conventions
- Use **snake_case** for all element names to avoid Terraform warnings:
    - ✅ `my_resource`  
    - ❌ `my-resource`  

---

## 4. Modules

### 4.1 Module Structure
- When your scripts are sufficiently large, use modules to promote reusability and maintainability.
- Each module should reside in its own directory, following the naming convention:  
   ```plaintext
   module-<FUNCTION>
   ```
- Example:
    - ✅ `module-security-groups`
    - ✅ `module-ec2-instances`

---

## 5. Comments and Descriptions

### 5.1 Comments
- **Minimise comments** where possible. Code should be self-explanatory.  
- Use **descriptions** instead of comments where supported, as descriptions are visible in the AWS console.

### 5.2 Example
```terraform
# Avoid comments like this
# This security group allows SSH access
resource "aws_security_group" "ssh" {
  description = "Allows SSH access"
  ...
}
```

---

## 6. Resources

### 6.1 Resource Naming
- Use **snake_case** for all resource names:
    - ✅ `my_instance`
    - ❌ `my-instance`
- This prevents Terraform warnings and maintains consistency.

---

## 7. Data Sources

### 7.1 Usage
- Use **data sources** to look up external data or resources defined in separate Terraform configurations.
- Examples include:
    - Data held in **HashiCorp Vault**
    - Infrastructure resources like **subnet CIDRs** or **VPC IDs**

### 7.2 Naming
- Use **snake_case** for data source names:
    - ✅ `my_data`
    - ❌ `my-data`

### 7.3 Remote State
- **Avoid using Terraform Remote State** for data lookups.  
- Review and remove any instances of:  
   ```terraform
   terraform_remote_state
   ```

---

## 8. Variables

### 8.1 Naming
- Use **meaningful and contextual variable names**.  
- Reflect the data being passed:
    - ✅ `web_cidrs` → (list of CIDRs for web servers)  
    - ❌ `my_subnet_cidrs` → (too vague)  

- Use **plural names** for lists and singular names for single values:
    - ✅ `server_ids` → List of server IDs  
    - ✅ `db_password` → Single password string  

### 8.2 Descriptions
- Omit descriptions if the variable name is clear.  
- Add descriptions for ambiguous or complex variables.

### 8.3 Type Declaration
- **Always specify the type** to prevent ambiguity and ensure robust code.

### 8.4 Example
```terraform
variable "web_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for web access"
}
```

---

## 9. Value Assignment

### 9.1 Methods
- Assign variable values using:
    - **Environment vars**
    - **Defaults**
    - **Locals blocks**

### 9.2 Guidance

#### 9.2.1 Defaults
- Use default values when they apply across multiple environments.  
- Avoid duplicating values across environments.

#### 9.2.2 Environment Vars
- Set environment-specific variables here.

#### 9.2.3 Local Vars
- Use `locals` to avoid repeating constants inside a module.
- Group related local variables for readability.

### 9.3 Example with Vault-Sourced Secrets
```terraform
locals {
  internal_cidrs = values(data.vault_generic_secret.internal_cidrs.data)
}
```
- Use `local.internal_cidrs` throughout the module instead of the full `data.vault_generic_secret...` path for clarity.

---

## 10. Security

- **Never commit sensitive values** (e.g., passwords, secrets) to source control.  
- Use tools like **HashiCorp Vault** or AWS Secrets Manager for secrets management.
- Even infrastructure details (e.g., CIDRs) should be handled carefully, as repositories can become public.

---

## 11. Grouping Variables

- Group related variables together under comments for readability. Include their type, description and default value.

### 11.1 Example
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

## 12. READMEs

### 12.1 Documentation Standards
- All scripts should include a **README** with:
    - **Purpose** of the script
    - List of variables with descriptions
    - Example usage  

### 12.2 Module-Specific Documentation
- When using modules:
    - Each module must include its own `README.md` for detailed documentation.  
    - The **root README** should link to individual module READMEs.

### 12.3 Example README Structure
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
