variable "region" {
  default = "eu-west-3"
}
variable "ami_name" {
  default = "test_ec2_packer"
}
variable "amis" {
  type = "map"
  default = {
    "eu-west-3" = "ami-0b6a2e0af12c15a39"
    "us-east-1" = "ami-b374d5a5"
  }
}