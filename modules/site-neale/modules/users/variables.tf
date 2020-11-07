variable "csv_path" {
  type        = string
  description = "The path to users CSV file."
}

variable "network_id" {
  type        = string
  description = "The network ID which the users belong to."
}

variable "domain_name" {
  type        = string
  description = "The domain name to append to user's name."
}