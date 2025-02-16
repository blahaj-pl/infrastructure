variable "domain" {
  type = string
}

variable "subname" {
  type    = string
  default = ""
}

variable "t_verify" {
  type = string
}

variable "txt" {
  type = list(string)
}
