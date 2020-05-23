variable "name" {
  description = "Specifies the name of the Backend Address Pool"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group in which to create the resource"
  type        = string
}

variable "lb_id" {
  description = "The ID of the Load Balancer in which to create the Backend Address Pool"
  type        = string
}