locals {
  # General variables
  prefix = "mcp-demo"
}

#--------------------------------------------------------------------------------------------------------------
# FGT Cluster module example
# - 1 FortiGate cluster FGCP in 2 AZ
#--------------------------------------------------------------------------------------------------------------
module "fgt-cluster" {
  source  = "jmvigueras/ftnt-aws-modules/aws//examples/basic_fgt-cluster"
  version = "0.0.15"

  prefix = local.prefix

  region = "eu-west-1"
  azs    = ["eu-west-1a"]

  fgt_build    = "build2795"
  license_type = "payg"

  fgt_number_peer_az = 1
  fgt_cluster_type   = "fgcp"

  public_subnet_names_extra  = ["bastion"]
  private_subnet_names_extra = ["protected"]
}


output "fgt" {
  value = module.fgt-cluster.fgt
}

locals {
}
