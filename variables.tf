variable "region" {
  description = "Specify the region in which VPC will be created"
  default     = "us-east-1"
  type        = string
}

variable "environment" {
  description = "Specify the environment indentifier for the VPC"
  default     = ""
  type        = string
}

variable "name" {
  description = "Specify the name of the VPC"
  default     = ""
  type        = string
}

variable "additional_aws_tags" {
  description = "Additional common Tags for all AWS resources"
  type        = map(string)
  default = {
    automation = "true"
  }
}

variable "vpc_cidr" {
  description = "The CIDR block of the VPC"
  default     = "10.0.0.0/16"
  type        = string
}

variable "azs" {
  description = "List of Availability Zone to be used by VPC"
  default     = []
  type        = list(any)
}

variable "enable_public_subnet" {
  description = "Set true to enable public subnets"
  default     = false
  type        = bool
}

variable "public_subnet_cidrs" {
  description = "A list of public subnets CIDR to be created inside the VPC"
  default     = []
  type        = list(any)
}

variable "enable_private_subnet" {
  description = "Set true to enable private subnets"
  default     = false
  type        = bool
}

variable "private_subnets" {
  description = "A list of private subnets CIDR to be created inside the VPC"
  default     = []
  type        = list(any)
}

variable "enable_database_subnet" {
  description = "Set true to enable database subnets"
  default     = false
  type        = bool
}

variable "database_subnets" {
  description = "Database Tier subnet CIDRs to be created"
  default     = []
  type        = list(any)
}

variable "enable_intra_subnet" {
  description = "Set true to enable intra subnets"
  default     = false
  type        = bool
}

variable "intra_subnets" {
  description = "A list of intra subnets CIDR to be created"
  default     = []
  type        = list(any)
}

variable "vpn_server_enabled" {
  description = "Set to true if you want to deploy VPN Gateway resource and attach it to the VPC"
  default     = false
  type        = bool
}

variable "vpn_server_instance_type" {
  description = "EC2 instance Type for VPN Server, Only amd64 based instance type are supported eg. t2.medium, t3.micro, c5a.large etc. "
  default     = "t3a.small"
  type        = string
}

variable "vpn_key_pair" {
  description = "Specify the name of AWS Keypair to be used for VPN Server"
  default     = ""
  type        = string
}

variable "default_network_acl_ingress" {
  description = "List of maps of ingress rules to set on the Default Network ACL"
  type        = list(map(string))

  default = [
    {
      rule_no    = 98
      action     = "deny"
      from_port  = 22
      to_port    = 22
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
    },
    {
      rule_no    = 99
      action     = "deny"
      from_port  = 3389
      to_port    = 3389
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
    },
    {
      rule_no    = 100
      action     = "allow"
      from_port  = 0
      to_port    = 0
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    },
    {
      rule_no         = 101
      action          = "allow"
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      ipv6_cidr_block = "::/0"
    },
  ]
}

variable "one_nat_gateway_per_az" {
  description = "Set to true if a NAT Gateway is required per availability zone for Private Subnet Tier"
  default     = false
  type        = bool
}

variable "enable_flow_log" {
  description = "Whether or not to enable VPC Flow Logs"
  type        = bool
  default     = false
}

variable "flow_log_cloudwatch_log_group_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group for VPC flow logs."
  type        = number
  default     = null
}

variable "flow_log_max_aggregation_interval" {
  description = "The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: `60` seconds or `600` seconds."
  type        = number
  default     = 60
}
