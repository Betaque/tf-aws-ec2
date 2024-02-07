# EC2 Module

This module creates a Amazon Elastic Compute Cloud (EC2) in AWS with customizable configurations.

## Usage

1. **Get Started:** Begin by creating the necessary files, provider.tf and main.tf, in your Terraform project directory.
2. **Declare Provider:** Open provider.tf and declare the AWS provider. Ensure you've configured your AWS credentials and set the desired region.
```
provider "aws" {
  region = "us-east-1" // Set your AWS region
}
```
3. **Add EC2 Module and Define Variables:** Incorporate the EC2 Module into your main.tf file, and set values for the variables defined in variables.tf.

For Example:-
```
module "ec2" {
  source                         = "git::https://github.com/Betaque/tf-aws-ec2.git//?ref=feat/generic-ec2" # Path of the Module
  instance_type                  = "t2.micro"
  public_subnet_id               = module.vpc_module.public_subnet_id
  private_subnet_id              = module.vpc_module.private_subnet_id
  ami                            = "ami-0c7217cdde317cfec"
  vpc_id                         = module.vpc_module.vpc_id
  ec2_security_group_name        = "ec2_security_group"
  ec2_ingress_rules              = [80, 22]
  ec2_ingress_cidr_blocks        = ["10.0.0.0/16"]
  ec2_ingress_rules_from_port    = [80, 22]
  ec2_ingress_rules_to_port      = [80, 22]
  ec2_ingress_rules_protocols    = ["tcp", "tcp"]
  ec2_egress_rules               = [0]
  ec2_egress_cidr_blocks         = ["0.0.0.0/0"]
  ec2_egress_rules_from_port     = [0]
  ec2_egress_rules_to_port       = [0]
  ec2_egress_rules_protocols     = ["-1"]
  aws_key_pair_name              = "tfkey"
  local_private_key_file_name    = "tfkey" 
  private_key_algorithm          = "RSA"
  private_key_rsa_bits           = 4096
  instance_count                 = 2
  instance_name                  = ["test-1", "test-2"] 
  security_group_name            = "test-sg" 
}
```

4. **Initialize Terraform:** Run the below terraform Command to initialize the project and download the module dependencies.
```
terraform init
```

5. **Apply Changes:** Execute the below terraform Command to create the VPC infrastructure based on the specified configurations.
```
terraform apply
``` 
