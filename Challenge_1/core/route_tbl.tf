# Public route table
resource "aws_route_table" "public" {

    vpc_id = "${aws_vpc.vpckpmg.id}"
    route {
        cidr_block = "${var.any_ip}"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }

    tags = {
        Name = "Public Route_KPMG"
    }
  
}

#public route table associations
resource "aws_route_table_association" "public1" {

    subnet_id = "${aws_subnet.publicsubnet1.id}"
    route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public2" {

    subnet_id      = "${aws_subnet.publicsubnet2.id}"
    route_table_id = "${aws_route_table.public.id}" 
}

# Private route table

resource "aws_route_table" "private" {

    vpc_id             = "${aws_vpc.vpckpmg.id}"

    route {
        nat_gateway_id = "${aws_nat_gateway.natgw.id}"
        cidr_block     = "${var.any_ip}"
    }

    tags               = {
    Name               = "Private Route_KPMG"
    }
  
}
#private route table associations
resource "aws_route_table_association" "private1" {

    subnet_id      = "${aws_subnet.privatesubnet1.id}"
    route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "private2" {

    subnet_id      = "${aws_subnet.privatesubnet2.id}"
    route_table_id = "${aws_route_table.private.id}"
}



