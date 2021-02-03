
# I have used link local address to get metadata for example to get instance id, ami id
instanceid='curl http://169.254.169.254/latest/meta-data/instance-id'
echo "instance id: $instanceid"
# get ami-id
amiid='curl http://169.254.169.254/latest/meta-data/ami-id'
echo "ami id: $amiid"


#found some code in .net here - https://github.com/aws/aws-sdk-net/blob/master/sdk/src/Services/EC2/Custom/_bcl/Util/EC2Metadata.cs
# found this to output in json - https://mwhiteley.com/virtualization/2013/02/23/golang-ec2-metadata.html
