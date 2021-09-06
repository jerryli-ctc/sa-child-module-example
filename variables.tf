# storage_account variables.tf file
 
variable "resource_group_name" {
  type = string
}
 
variable "location" {
  type = string
}
 
variable "storage_account_name" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "subscription_id" {
  type = string 
}

variable "tenent_id" {
  type = string
}