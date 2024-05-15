module "vpc" {
  source = "./vpc"
  vpc_cidr = "10.0.0.0/16"
  pb_cidr = "10.0.1.0/24"
  ext_ip = "0.0.0.0/0"
}

module "ec2" {
  source = "./web"
  sg = module.vpc.sg
  sn = module.vpc.pb_sn
}