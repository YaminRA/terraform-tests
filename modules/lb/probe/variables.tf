variable "name" {
  description = "Specifies the name of the Probe"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group in which to create the resource"
  type        = string
}

variable "lb_id" {
  description = "The ID of the LoadBalancer in which to create the NAT Rule"
  type        = string
}

variable "protocol" {
  description = "Specifies the protocol of the end point. Possible values are Http, Https or Tcp. If Tcp is specified, a received ACK is required for the probe to be successful. If Http is specified, a 200 OK response from the specified URI is required for the probe to be successful"
  type        = string
}

variable "port" {
  description = "Port on which the Probe queries the backend endpoint. Possible values range from 1 to 65535, inclusive"
  type        = number
}