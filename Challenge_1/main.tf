provider "aws" {
    region     = "${var.region}"
    access_key = "${var.access_key_id}"
    secret_key = "${var.secret_access_key_id}"
}

module "core" {
  source = "./core"  
}

module "load_balancers" {
  source          = "./load_balancers"

  public_subnet1  = "${module.site.outputpublicsubnet1}"
  public_subnet2  = "${module.site.outputpublicsubnet2}"
  private_subnet1 = "${module.site.outputprivatesubnet1}"
  private_subnet2 = "${module.site.outputprivatesubnet1}"
  vpc_id          = "${module.site.output_vpc_id}"
  external_alb_sg = "${module.site.output_external_alb_sg}"
  internal_alb_sg = "${module.site.output_internal_alb_sg}"
 
  
}

module "autoscaling_groups" {
  source            = "./autoscaling_groups"
  mobile_launch_config = "${module.launch_configurations.app_lc_name}"
  app_launch_config = "${module.launch_configurations.mobile_lc_name}"
  public_subnet1    = "${module.site.outputpublicsubnet1}"
  public_subnet2    = "${module.site.outputpublicsubnet2}"
  private_subnet1   = "${module.site.outputprivatesubnet1}"
  private_subnet2   = "${module.site.outputprivatesubnet2}"
  out_tg_instances  = "${module.load_balancers.out_tg_instances}"
  internaltg        = "${module.load_balancers.internaltg}"
}

module "launch_configurations" {
  source                  = "./launch_configurations"
  output_mobile_sg           = "${module.site.output_mobile_sg}"
  external_alb_sg         = "${module.site.output_external_alb_sg}"
  output_execution_ssh      = "${module.site.output_execution_ssh}"
  output_internal_alb_sg  = "${module.site.output_internal_alb_sg}"

}

module "ec2_instances" {
  source                      = "./ec2_instances"
  public_subnet1              = "${module.site.outputpublicsubnet1}"
  private_subnet1             = "${module.site.outputprivatesubnet1}"
  private_subnet2             = "${module.site.outputprivatesubnet2}"
  output_execution_ssh          = "${module.site.output_execution_ssh}"
}


module "databases" {
  source                      = "./databases"
  private_subnet1             = "${module.site.outputprivatesubnet1}"
  private_subnet2             = "${module.site.outputprivatesubnet2}"
  out_rdssubnetgroup          = "${module.site.out_rdssubnetgroup}"
  rdsmysqlsg                  = "${module.site.rdsmysqlsg}"
  
}