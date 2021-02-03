resource "aws_autoscaling_group" "appasg" {

    name                 = "appautoscalinggroup"
    max_size             = "${var.asg_max}"
    min_size             = "${var.asg_min}"
    launch_configuration = "${var.app_launch_config}"
    force_delete         = true
    vpc_zone_identifier  = ["${var.private_subnet1}","${var.private_subnet2}"]
    health_check_type    = "EC2"
    health_check_grace_period = 1200


  
}