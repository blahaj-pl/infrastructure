variable "domain" {
  type = string
}

variable "subname" {
  type = string
}

variable "records" {
  type = map(list(string))
}

variable "ttl" {
  type    = number
  default = 3600
}
