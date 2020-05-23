variable "name" {
  description = "Specifies the name of the LB Rule"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group in which to create the resource"
  type        = string
}

variable "lb_id" {
  description = "The ID of the Load Balancer in which to create the Rule"
  type        = string
}

variable "fe_ipc_name" {
  description = "The name of the frontend IP configuration to which the rule is associated"
  type        = string
}

variable "protocol" {
  description = "The transport protocol for the external endpoint. Possible values are Tcp, Udp or All"
  type        = string
}

variable "fe_port" {
  description = "The port for the external endpoint. Port numbers for each Rule must be unique within the Load Balancer. Possible values range between 0 and 65534, inclusive"
  type        = number
}

variable "be_port" {
  description = "The port used for internal connections on the endpoint. Possible values range between 0 and 65535, inclusive"
  type        = number
}

variable "lb_bap_id" {
  description = "A reference to a Backend Address Pool over which this Load Balancing Rule operates"
  type        = string
}

variable "lb_pb_id" {
  description = "A reference to a Probe used by this Load Balancing Rule"
  type        = string
}