resource "aws_vpc" "test-env" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "test-env"
  }
}

resource "aws_eip" "ip-test-env" {
  instance = "${aws_instance.test-ec2-instance.id}"
  vpc      = true
  
  provisioner "local-exec" {
    // get the IP from AWS with a provisioner
    command = "echo ${aws_eip.ip-test-env.public_ip} > eip_address.txt"
  }
}
output "ip" {
  // get the IP from AWS with an output statment
  value = "${aws_eip.ip-test-env.public_ip}"
}
