###cloud vars

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

###ssh vars

variable "vm_web_env" {
  type        = string
  default     = "prod"
  description = "Environment for web VM (prod/dev/stage)"
}

variable "vm_web_project" {
  type        = string
  default     = "platform"
  description = "Project name for web VM"
}

variable "vm_web_role" {
  type        = string
  default     = "web"
  description = "Role of web VM"
}

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex compute image family"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "yandex compute instance platform id"
}

variable "vms_resources" {
  description = "Resources configuration for all VMs"
  type = map(object({
    cores           = number
    memory          = number
    core_fraction   = number
    hdd_size        = number
    hdd_type        = string
    preemptible     = bool
    nat             = bool
    serial_port_enable = number
  }))
  default = {
    web = {
      cores           = 2
      memory          = 1
      core_fraction   = 5
      hdd_size        = 5
      hdd_type        = "network-hdd"
      preemptible     = true
      nat             = true
      serial_port_enable = 1
    }
    db = {
      cores           = 2
      memory          = 2
      core_fraction   = 20
      hdd_size        = 5
      hdd_type        = "network-hdd"
      preemptible     = true
      nat             = true
      serial_port_enable = 1
    }
  }
}

variable "metadata" {
  description = "Common metadata for all VMs"
  type = map(string)
  default = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:<your_ssh_ed25519_key>"
  }
}