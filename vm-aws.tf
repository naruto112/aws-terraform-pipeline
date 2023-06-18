# resource "aws_key_pair" "key" {
#   key_name   = "aws-key"
#   public_key = var.aws_pub_key
# }

resource "aws_instance" "vm" {
  depends_on    = [aws_vpc.vpc, aws_subnet.subnet]
  ami           = "ami-022e1a32d3f742bd8"
  instance_type = "t2.micro"
  # key_name                    = aws_key_pair.key.key_name
  subnet_id                   = aws_subnet.subnet.id
  vpc_security_group_ids      = [aws_security_group.security_group.id]
  associate_public_ip_address   = true

  tags = {
    "Name" = "vm-terraform"
  }
}