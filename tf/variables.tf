variable "ami_id" {
  type        = string
  default     = "ami-0885b1f6bd170450c"
  description = "ID of the AMI in a format 'ami-1z2x3c4v5b6m'"

}
variable "eip_attach" {
  type        = bool
  default     = false
  description = "Selector for ElasticIP: true == create and attach"
}
variable "inst_type" {
  type        = string
  default     = "t2.micro"
  description = "Choosing instance type (Default: \"t2.micro\")"
}
variable "hlltf1_pub" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3yu+bHuOILNTi8jUEsglJAIxTdXpfFaQQYau5u5QKuLaoPEM/i55hNPNYSPimu9UCB7s4XE2Bos31IU6+6l4jHdkGJjGUzFE8TGZXAEY547ajp0JiQ8jQdjB+LUU/c74/QW7OaHyT8bHJML222lkIfgDo9Sln3HLvCp3/EWWGwqJKC6F6npJ1nj0VDgPiU8JIKwmxkLCjprKa5I2kjx4weoNzHNLor00+PT/nvyXpXv9LLvqiB4mkooVcDz7lHdqDCQxY8oziCnzQe9MJpaRUOkLp7Nbd8vh40ppwRDar759qOC9BD6PXSr99PvG217YlJWkblfdwRx1s4m1hqh19"
  description = "Public key (will be registered as AWS KeyPair)"
}