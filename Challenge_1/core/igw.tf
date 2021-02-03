resource "aws_internet_gateway" "gw" {
        vpc_id = "${aws_vpc.vpckpmg.id}"

        tags   = {
        Name   = "Internet Gateway_KPMG"
        }
  
}