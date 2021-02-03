# EC2 Instances
variable "amis" {
    
    default = "ami-xxxxx"
  
}

variable "instance_type" {

    default = "t2.nano"
  
}

variable "public_subnet1" {}
variable "output_execution_ssh" {}
variable "private_subnet1" {}
variable "private_subnet2" {}
variable "app_access_from_nat_prv_sg" {}
variable "app_access_from_nat_pub_sg" {}
