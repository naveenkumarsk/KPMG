resource "aws_vpc" "vpckpmg" {
    cidr_block = "${var.vpc_cdir_block}"

    tags = {
        Name = "VPC KPMG"
    }
  
}
output "output_vpc_id" {
  value = "${aws_vpc.vpckpmg.id}"
}

resource "aws_subnet" "publicsubnet1" {
    
    vpc_id            = "${aws_vpc.vpckpmg.id}"
    cidr_block        = "${var.public_subnet_1}"
    availability_zone = "${var.availability_zone_A}"

    tags              = {
    Name              = "Public Subnet-1_kpmg"
    }
  
}

output "outputpublicsubnet1" {
  value = "${aws_subnet.publicsubnet1.id}"
}

resource "aws_subnet" "publicsubnet2" {
    
    vpc_id            = "${aws_vpc.vpckpmg.id}"
    cidr_block        = "${var.public_subnet_2}"
    availability_zone = "${var.availability_zone_B}"

    tags              = {
    Name              = "Public Subnet-2_kpmg"
    }
  
}

output "outputpublicsubnet2" {
  value              = "${aws_subnet.publicsubnet2.id}"
}

resource "aws_subnet" "privatesubnet1" {
    
    vpc_id            = "${aws_vpc.vpckpmg.id}"
    cidr_block        = "${var.private_subnet_1}"
    availability_zone = "${var.availability_zone_A}"

    tags              = {
    Name              = "Private Subnet-1_kpmg"
    }
  
}

output "outputprivatesubnet1" {
  value = "${aws_subnet.privatesubnet1.id}"
}

resource "aws_subnet" "privatesubnet2" {
    
    vpc_id            = "${aws_vpc.vpckpmg.id}"
    cidr_block        = "${var.private_subnet_2}"
    availability_zone = "${var.availability_zone_B}"

    tags              = {
    Name              = "Private Subnet-2_kpmg"

    }
  
}

output "outputprivatesubnet2" {
  value = "${aws_subnet.privatesubnet2.id}"
}

resource "aws_db_subnet_group" "dbsubnetgroup" {
    
    name             = "db_subnet_group"
    subnet_ids       = ["${aws_subnet.privatesubnet1.id}", "${aws_subnet.privatesubnet2.id}"]

    tags             = {

    name             = "My db Subnet Group"
    }
  
}

output "out_dbsubnetgroup" {
  value = "${aws_db_subnet_group.dbsubnetgroup.id}"
}


