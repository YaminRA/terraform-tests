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

variable "protocol" {
    description = "Rule protocol"
    type = string
}

variable "fe_ipc_name" {
    description = "Frontend IP configuration name"
    type = string
}

variable "fe_port" {
    description = "Port to receive requests"
    type = number
}

variable "be_port" {
    description = "Port to send requests"
    type = number
}

variable "lb_bap_id" {
    description = "Load Balancer Backend Address Pool ID"
    type = string
}

variable "lb_probe_id" {
    description = "Load Balancer Health probe ID"
    type = string
}