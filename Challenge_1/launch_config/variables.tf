variable "amis" {
    
    default = "ami-xxxxxxx"
  
}

variable "instance_type" {

    default = "t2.micro"
  
}

variable "instance_type_internal" {

    default = "t2.micro"
  
}

variable "output_app_sg" {} 
variable "external_alb_sg" {} 
variable "output_execution_ssh" {}   
variable "output_internal_alb_sg" {}