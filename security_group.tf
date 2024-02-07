resource "aws_security_group" "aws_ec2_security_group" {
  name   = var.aws_ec2_sg_name
  vpc_id = var.vpc_id 

  tags = {
    Name = var.aws_ec2_sg_name
  }
}

resource "aws_security_group_rule" "aws_ec2_ingress_rules" {
  count = length(var.aws_ec2_ingress_rules)

  security_group_id = aws_security_group.aws_ec2_security_group.id
  type              = "ingress"

  cidr_blocks = var.aws_ec2_ingress_cidr_blocks
  from_port   = var.aws_ec2_ingress_rules_from_port[count.index]
  to_port     = var.aws_ec2_ingress_rules_to_port[count.index]
  protocol    = var.aws_ec2_ingress_rules_protocols[count.index]
}

resource "aws_security_group_rule" "aws_ec2_egress_rules" {
  count = length(var.aws_ec2_egress_rules)

  security_group_id = aws_security_group.aws_ec2_security_group.id
  type              = "egress"

  cidr_blocks = var.aws_ec2_egress_cidr_blocks
  from_port   = var.aws_ec2_egress_rules_from_port[count.index]
  to_port     = var.aws_ec2_egress_rules_to_port[count.index]
  protocol    = var.aws_ec2_egress_rules_protocols[count.index]
}
