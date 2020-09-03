# Resource Group/Location
variable "location" {}
variable "application_type" {}
variable "resource_type" {}
variable "resource_group" {}
variable "subnet_id" {}
variable "public_ip" {}
variable "prefix" {
  default = "quality_"
}
