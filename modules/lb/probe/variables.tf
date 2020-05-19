variable "rg_name" {
  description = "Resource Group where Availability Set will be deployed"
  type        = string
}

variable "lb_name" {
  description = "Load Balancer name to attach Backend Address Pool"
  type        = string
}

variable "lb_id" {
  description = "Load Balancer ID to attach Backend Address Pool"
  type        = string
}

variable "port" {
    description = "Port to perform health probe"
    type = number
}