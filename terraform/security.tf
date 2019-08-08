resource "aws_security_group" "ingress-all-test" {
  name = "allow-all-ingress-ssh"
  description = "allow ingress ssh connections"
  vpc_id = "${aws_vpc.test-env.id}"
  ingress {
      cidr_blocks = ["0.0.0.0/0"]
      from_port = 0
      to_port = 22
      protocol = "tcp"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port = 80
    protocol = "tcp"
  }
  tags = {
    Name = "allow_ingress_http"
  }
}

