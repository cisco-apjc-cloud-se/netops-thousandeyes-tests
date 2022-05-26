variable "te_token" {
  type = string
}

variable "agent_list" {
  type  = list(string)
}

variable "http_tests" {
  type = map(object({
    name = string
    url = string
  }))
}
