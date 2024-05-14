# OCI File Storage Module

This Terraform module creates and manages OCI file storage file systems and mount targets in Oracle Cloud Infrastructure (OCI).

## Features

- Creates and manages OCI file storage file systems and mount targets.
- Supports creating multiple file systems and mount targets.
- Allows specifying export sets and paths for file systems.

## Prerequisites

Before using this module, make sure you have the following:

- OCI account credentials with the necessary permissions to create resources.
- Terraform (v1.0.0 or above) installed and configured correctly.
- Terraform OCI provider (v4.96.0 or above) installed and configured correctly.

## Usage
To use this module, include it in your Terraform configuration and specify the required input variables. Here's a basic example of how to use the module:

```hcl
module "oci_file_storage" {
  source         = "path_to_module"
  
  # mount target
  tenancy_ocid   = "your_tenancy_ocid"
  compartment    = "your_compartment_name"
  network_cmp    = "your_network_compartment_name"
  subnet_name    = "your_subnet_name"
  display_name   = "mount_target_display_name"
  ad_number      = 1

  defined_tags  = {}
  freeform_tags = {}

  # file system and optinal paths
  file_systems = {
    "fs1" = {
        defined_tags = {}
        exports = {
            "export1" = {
                "paths" = {
                    "/path1" = {
                        "source" = "0.0.0.0/0",
                        "access" = "READ_WRITE",
                        "anonymous_gid" = null,
                        "anonymous_uid" = null,
                        "identity_squash" = "NONE",
                        "require_privileged_source_port" = "false"
                    },
                    "/path2" = {
                        "source" = "0.0.0.0/0",
                        "access" = "READ_WRITE",
                        "anonymous_gid" = null,
                        "anonymous_uid" = null,
                        "identity_squash" = "NONE",
                        "require_privileged_source_port" = "false"
                    }
                }
            }
        }
    }
  }
}
```

- Replace "path_to_module" with the path to the module directory or the Git repository URL.
- Replace the values with your specific requirements.

## Variables
Before using this module, you must configure the required variables. These can be set in a terraform.tfvars file for easy module configuration.

| Name              | Description                                                       | Type        | Default | Required |
|-------------------|-------------------------------------------------------------------|-------------|---------|----------|
| tenancy_ocid      | The OCID of the root compartment.                                 | string      | -       | yes      |
| compartment       | Compartment name where to create all resources.                   | string      | null    | yes      |
| network_cmp       | Compartment name for networking resources.                        | string      | null    | yes      |
| subnet_name       | Virtual cloud network subnet name.                                | string      | ""      | yes      |
| display_name      | A user-friendly name for the mount target.                        | string      | null    | yes      |
| ad_number         | The availability domain in which to create the file storage resources. | number  | -       | yes      |
| compartment_id    | The OCID of the compartment where to create all resources.        | string      | null    | no      |
| network_cmp_id    | Compartment id for networking resources.                          | string      | null    | no       |
| freeform_tags     | Free-form tags for this resource.                                 | map(string) | {}      | no       |
| defined_tags      | Defined tags for this resource.                                   | map(string) | {}      | no       |
| file_systems      | Provides the file system resource in Oracle Cloud Infrastructure. | map(any)    | {}      | no       |

- **Note:** If `compartment_id` is provided, it will override the `compartment` variable.
- **Note:** If `network_cmp_id` is provided, it will override the `network_cmp` variable.

### `file_systems` Object details:
The file_systems map should be formatted as follows:
```hcl
file_systems = {
    "fs1" = {
        defined_tags = {}
        exports = {
            "export1" = {
                "paths" = {
                    "/path1" = {
                        "source" = "0.0.0.0/0",
                        "access" = "READ_WRITE",
                        "anonymous_gid" = null,
                        "anonymous_uid" = null,
                        "identity_squash" = "NONE",
                        "require_privileged_source_port" = "false"
                    },
                    "/path2" = {
                        "source" = "0.0.0.0/0",
                        "access" = "READ_WRITE",
                        "anonymous_gid" = null,
                        "anonymous_uid" = null,
                        "identity_squash" = "NONE",
                        "require_privileged_source_port" = "false"
                    }
                }
            }
        }
    }
}
```

- Each key in the map represents the name of the file system, and the corresponding value is a map containing optional parameters such as `defined_tags` and `exports`.
- Furthermore, `exports` is another map. Each key in the map represents the name of the export set, and the corresponding value is a map containing paths with their associated export options such as `source`, `access`, `anonymous_gid`, `anonymous_uid`, `identity_squash`, and `require_privileged_source_port`.

## Outputs

This module does not currently have any outputs. You can define outputs as needed based on the resources created within the module.

## Notes
- Ensure that you have the necessary IAM permissions to create resources in the specified compartments and VCN.
- Review and customize the module inputs according to your specific requirements.
- For more information on DNS Views in OCI and its configuration options, refer to the [OCI documentation](https://docs.oracle.com/en-us/iaas/Content/File/Concepts/filestorageoverview.htm).
