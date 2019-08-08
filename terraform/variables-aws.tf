variable "region" {
  default = "eu-west-3"
}
variable "ami_name" {
  default = "test_ec2_packer"
}
variable "amis" {
  type = "map"
  default = {
    "eu-west-3" = "ami-0294a5c813a5ce480"
    "us-east-1" = "ami-b374d5a5"
  }
}