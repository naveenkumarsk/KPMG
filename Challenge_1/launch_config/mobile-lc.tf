resource "aws_launch_configuration" "mobile-lc" {

    name                       = "mobile_Launch_Config"
    image_id                   = "${var.amis}"
    instance_type              = "${var.instance_type}"
    security_groups            = [
                                 "${var.external_alb_sg}",
                                 "${var.output_execution_ssh}",
                                 "${var.output_app_sg}"
                                  ]

    associate_public_ip_address = true
    user_data                  = "${file("./launch_configurations/userdata.sh")}"
    key_name                   = "myec2key"
  
}

output "mobile_lc_name" {
  value = "${aws_launch_configuration.mobile-lc.name}"
}
