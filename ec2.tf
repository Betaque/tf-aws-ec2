resource "aws_instance" "aws_ec2_public_instance" {
  ami                         = var.aws_ami
  instance_type               = var.aws_instance_type
  count                       = var.aws_ec2_instance_count
  subnet_id                   = element(var.subnet_ids[*], count.index)
  key_name                    = aws_key_pair.key_pair.key_name
  security_groups             = [ aws_security_group.aws_ec2_security_group.id ]
  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    Name = element(var.aws_ec2_instance_name, count.index)
  }
}
