# EC2
resource "aws_instance" "execution" {

    ami                         = "${var.amis}"
    instance_type               = "${var.instance_type}"
    subnet_id                   = "${var.public_subnet1}"
    associate_public_ip_address = true
    key_name                    = "myec2key"
    vpc_security_group_ids      = ["${var.output_execution_ssh}"]

    tags                        = {
        Name = "execution_kpmg"
    }
 
}
#elastic ip
resource "aws_eip" "execution_eip" {

    instance                    = "${aws_instance.execution.id}"
    vpc                         = true
  
}

resource "aws_instance" "prv_sub_1_instance" {

    ami                         = "${var.amis}"
    instance_type               = "${var.instance_type}"
    subnet_id                   = "${var.private_subnet1}"
    key_name                    = "myec2key"
    vpc_security_group_ids      = [
                                  "${var.output_execution_ssh}",
                                  "${var.app_access_from_nat_prv_sg}"
                                  
    ]
    tags                        = {
        Name                    = "Prv 1 Instance"
    }
  
}

resource "aws_instance" "prv_sub_2_instance" {

    ami                         = "${var.amis}"
    instance_type               = "${var.instance_type}"
    subnet_id                   = "${var.private_subnet2}"
    key_name                    = "myec2key"
    vpc_security_group_ids      = [
                                  "${var.output_execution_ssh}",
                                  "${var.app_access_from_nat_prv_sg}"
                                  
    ]
    tags                        = {
        Name                    = "Prv 2 Instance"
    }
  
}
