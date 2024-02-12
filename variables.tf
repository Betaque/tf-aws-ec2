variable "subnet_ids" {
  description = "The VPC Subnet ID's to launch instances"
  type = list(string)
}

variable "aws_instance_type" {
  description = "The type of EC2 instance to launch, e.g., t2.micro, m5.large, etc."
  type        = string
}

variable "aws_ami" {
  description = "The ID of the Amazon Machine Image (AMI) to use for the EC2 instance."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the Virtual Private Cloud (VPC) where the EC2 instance will be launched."
  type        = string
}

variable "aws_ec2_sg_name" {
  description = "The name of the security group for the EC2 instance."
  type        = string
}

variable "aws_ec2_ingress_rules" {
  description = "A list of ingress rules for the EC2 security group."
  type        = list(string)
}

variable "aws_ec2_ingress_cidr_blocks" {
  description = "List of CIDR blocks for EC2 security group ingress rules."
  type        = list(string)
}

variable "aws_ec2_ingress_rules_from_port" {
  description = "List of from_port values for EC2 security group ingress rules."
  type        = list(number)
}

variable "aws_ec2_ingress_rules_to_port" {
  description = "List of to_port values for EC2 security group ingress rules."
  type        = list(number)
}

variable "aws_ec2_ingress_rules_protocols" {
  description = "List of protocols for EC2 security group ingress rules."
  type        = list(string)
}

variable "aws_ec2_egress_rules" {
  description = "A list of egress rules for the EC2 security group."
  type        = list(string)
}

variable "aws_ec2_egress_cidr_blocks" {
  description = "List of CIDR blocks for EC2 security group egress rules."
  type        = list(string)
}

variable "aws_ec2_egress_rules_from_port" {
  description = "List of from_port values for EC2 security group egress rules."
  type        = list(number)
}

variable "aws_ec2_egress_rules_to_port" {
  description = "List of to_port values for EC2 security group egress rules."
  type        = list(number)
}

variable "aws_ec2_egress_rules_protocols" {
  description = "List of protocols for EC2 security group egress rules."
  type        = list(string)
}

variable "aws_key_pair_name" {
  description = "The name of the AWS Key Pair to associate with the EC2 instance."
  type        = string
}

variable "local_private_key_file_name" {
  description = "The file name of the local private key used to connect to the EC2 instance."
  type        = string
}

variable "private_key_algorithm" {
  description = "The algorithm to use for generating the private key, e.g., RSA, DSA, etc."
  type        = string
}

variable "private_key_rsa_bits" {
  description = "The number of bits for RSA private key generation, e.g., 2048, 4096, etc."
  type        = number
}

variable "aws_ec2_instance_count" {
  description = "The number of instances to be created."
  type        = number
}

variable "aws_ec2_instance_name" {
  description = "The name of the instances to be created."
  type        = list
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  type        = bool
}
