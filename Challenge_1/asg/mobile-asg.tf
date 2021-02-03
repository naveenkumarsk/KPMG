resource "aws_autoscaling_group" "mobileasg" {

    name                 = "mobileautoscalinggroup"
    max_size             = "${var.asg_max}"
    min_size             = "${var.asg_min}"
    launch_configuration = "${var.mobile_launch_config}"
    force_delete         = true
    vpc_zone_identifier  = ["${var.public_subnet1}","${var.public_subnet2}"]
    health_check_type    = "EC2"
    health_check_grace_period = 1200
  
}