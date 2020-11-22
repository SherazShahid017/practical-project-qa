# Configure the AWS Provider
provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
}

module "VPC" {
  source = "./VPC"

}

module "EC2" {
  source  = "./EC2"
  ec2sub  = module.VPC.ec2subnet
  secID   = module.VPC.securityID
  pub-key = var.public-key
  scripts = data.template_file.scripts.template
}

module "RDS" {
  source       = "./RDS"
  priv-sub-id  = module.VPC.privsub-id
  priv-sub-id2 = module.VPC.privsub-id2
  secid        = module.VPC.securityID
}

data "template_file" "scripts" {
  template = file("${path.module}/EC2/script/script.sh")
}

#module "EKS" {
#  source  = "./EKS"
#  sub1-id = module.VPC.privsub-id
#  sub2-id = module.VPC.privsub-id2
#  sec-id  = module.VPC.securityID
#}