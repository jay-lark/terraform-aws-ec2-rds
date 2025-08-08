# terraform-aws-ec2-rds

Module that will create a VPC containing an EC2 instance and RDS Aurora MySQL database.

The EC2 instance will be placed in a the public subnet and given a public IP if the following is set `publicly_accessible = true`. Otherwise the instance will be placed in a private subnet.

Connectivity to the EC2 instance is available through AWS Sesstion Manager.

The username and password for the database can be found in a secret created in Secrets Manager.

** Example Usage **

```
module "fw" {
  source = "git@github.com:jay-lark/terraform-aws-ec2-rds.git"

  name               = "freewill"
  vpc_cidr           = "172.31.0.0/16"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets    = ["172.31.0.0/19", "172.31.32.0/19", "172.31.64.0/19"]
  public_subnets     = ["172.31.128.0/19", "172.31.160.0/19", "172.31.192.0/19"]

  publicly_accessible = true

  providers = {
    aws = aws
  }
}
```

For full configuration values check out `variables.tf` in the project root.

** To Do **
I ran out of time but I would have liked to allow a list of security groups for the EC2 instance to be placeto to be provided. Right now it is kind of stuck to the one security group.

The module creates subnets across 3 availability zones and the RDS cluster will use them, but right now the instance will always be placed in the first AZ.
