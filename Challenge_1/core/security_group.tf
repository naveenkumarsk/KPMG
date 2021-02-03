resource "aws_security_group" "execution_ssh_all_sg_kpmg" {
    
    name            = "execution_ssh_all_sg_kpmg"
    description     = "Allow SSH from Anywhere"
    vpc_id          = "${aws_vpc.vpckpmg.id}"  

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["${var.any_ip}"]
    }

    egress {
        from_port   = "0"
        to_port     = "0"
        protocol    = "-1"
        cidr_blocks = ["${var.any_ip}"]

    }

    tags            = {
        
    Name            = "Execution Allow All_KPMG"
    }  
  
}
output "output_execution_ssh" {
  value = "${aws_security_group.execution_ssh_all_sg_execution.id}"
}

#other security groups to be added