resource "aws_instance" "test-ec2-instance" {
  ami = "${var.amis["${var.region}"]}"
  instance_type = "t2.micro"
  key_name = "ec2-demo"
  #security_groups = ["${aws_security_group.ingress-all-test.id}"]
  tags = {
    Name = "${var.ami_name}"
  }
  #subnet_id = "${aws_subnet.subnet-zero.id}"
}
output "ip" {
  // get the IP from AWS with an output statment
  value = "${aws_instance.test-ec2-instance.public_ip}"
}

