# EC2 Module

This module creates a Amazon Elastic Compute Cloud (EC2) in AWS with customizable configurations.

### Prerequisites
- An AWS account.
- Terraform CLI installed on your local machine, you can check it, [How to Install Guideline here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### AWS Authentication 
This guide outlines the process of authenticating with AWS using Terraform through Access Key and Secret Key.

**Generate Access Key and Secret Key:**
1. Log in to your AWS Management Console.
2. Go to the IAM service.
3. Navigate to the Users section and select the user for whom you want to generate the access key and secret key.
4. Under the Security credentials tab, click on Create access key.
5. Make sure to save the access key ID and secret access key. These will be used for authentication.

### Module Configurations:
 
**1. Create a new Terraform configuration file (e.g., provider.tf) or use an existing one.**

**2. Add the following code to configure AWS provider with access key and secret key:**

```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  region     = "us-west-2"  # Replace with your desired AWS region
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
}
```
Replace **YOUR_ACCESS_KEY** and **YOUR_SECRET_KEY** with the access key ID and secret access key generated in the previous step.

or you can export your access_key and secret_key on your local machine.
```
export access_key="YOUR_ACCESS_KEY"
export secret_key="YOUR_SECRET_KEY"
```

**3. Add EC2 Module and Define Variables:**


Add the EC2 Module to your main.tf file and fill in the variables in variables.tf with the values you need. Just replace the example values with your own settings.

**For Example:-**

```
module "ec2" {
  source                                  = "git::https://github.com/Betaque/tf-aws-ec2.git//?ref=feat/generic-ec2" # Path of the Module
  aws_instance_type                       = "t2.micro"
  public_subnet_id                        = <YOUR_PUBLIC_SUBNET_ID>
  private_subnet_id                       = <YOUR_PRIVATE_SUBNET_ID>
  aws_ami                                 = "ami-0c7217cdde317cfec"
  vpc_id                                  = <YOUR_VPC_ID>
  aws_ec2_ingress_rules                   = [3306, 22]
  aws_ec2_ingress_cidr_blocks             = ["0.0.0.0/0"]
  aws_ec2_ingress_rules_from_port         = [3306, 22]
  aws_ec2_ingress_rules_to_port           = [3306, 22]
  aws_ec2_ingress_rules_protocols         = ["tcp", "tcp"]
  aws_ec2_egress_rules                    = [0]
  aws_ec2_egress_cidr_blocks              = ["0.0.0.0/0"]
  aws_ec2_egress_rules_from_port          = [0]
  aws_ec2_egress_rules_to_port            = [0]
  aws_ec2_egress_rules_protocols          = ["-1"]
  aws_key_pair_name                       = "tfkey"
  local_private_key_file_name             = "tfkey" 
  private_key_algorithm                   = "RSA"
  private_key_rsa_bits                    = 4096
  aws_ec2_instance_count                  = 2
  aws_ec2_instance_name                   = ["test-1", "test-2"] 
  aws_ec2_sg_name                         = "test-sg" 
}
```

**4. Initialize Terraform:** 

Open a terminal and navigate to the directory containing your Terraform configuration file.

Run the following command to initialize Terraform:
```
terraform init
```

**5. Apply Terraform Configuration:** 

After initializing, you can now apply the Terraform configuration to authenticate with AWS:
```
terraform apply
``` 
