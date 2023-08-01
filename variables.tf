variable "name" {
  description = "(Required) The name of the private dns record."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group of the dns zone."
  type        = string
}

variable "vnet_links" {
  description = "(Optional) A list of virtual networks to link with the dns zone, only needed when dns zone is private."
  type = list(object({
    vnet_id = string
    name    = string
  }))
  default = []
}

variable "a_records" {
  description = "(Optional) The a records to add to the private dns zone."
  type = list(object({
    name    = string
    ttl     = number
    records = list(string)
  }))
  default = []
}

variable "aaaa_records" {
  description = "(Optional) The aaaa records to add to the private dns zone."
  type = list(object({
    name    = string
    ttl     = number
    records = list(string)
  }))
  default = []
}
