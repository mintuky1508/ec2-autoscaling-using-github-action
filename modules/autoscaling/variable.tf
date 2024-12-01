variable "desired_capacity" {}
variable "max_size" {}
variable "min_size" {}
variable "launch_template_id" {}
variable "subnet" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "name" {}
variable "tag_name" {}
