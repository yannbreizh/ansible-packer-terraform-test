Ansible, Packer, and Terraform test
===

This project combines Ansible, Packer, and Terraform to show how to 
automagically script and deploy a server with no manual configuration.
* [Ansible](https://www.ansible.com/) - Automates server configuration
* [Packer](https://www.packer.io/) - Builds images of a configured server, but
doesn't actually deploy it
* [Terraform](https://www.terraform.io/) - Handles deploying an actual server

## Overview

This project creates an AWS ec2 instance that runs a local version of the website
[https://growlerfriday.com](https://growlerfriday.com) - which is pulled down
from [its GitHub repo](https://github.com/alkrauss48/growler-friday) and run using nginx.

Edit the /etc/hosts file to point growlerfriday.com to the IP address of
the created ec2 instance to access the web server.

## Requirements

Packer and terraform must be installed.
AWS credentials should be configured in the ~/.aws/credential file, with the following format:
  [YOUR_PROFILE]
  aws_access_key_id = YOUR_ACCESS_KEY
  aws_secret_access_key = YOUR_SECRET_ACCESS_KEY 

## Usage

```bash

make packer-build
# This will take about 5 minutes. Copy the Snapshot ID you get at the end

make terraform-init
# Only have to do this once

make terraform-plan
<enter Snapshot ID from packer-build command>
# This proceeds with a syntax check
# If all looks good, then:

make terraform-apply
<enter Snapshot ID from packer-build command>
# This may last a couple of minute to start the terraform architecture in AWS

make terraform-destroy
<enter Snapshot ID from packer-build command>
# This will stop all instances that have been launched with terraform-apply

# Done!
```