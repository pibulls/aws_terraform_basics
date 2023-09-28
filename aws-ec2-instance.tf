# Create an EC2 instance
resource "aws_instance" "example" {
# Use the latest Amazon Linux 2 AMI
ami           = "ami-0c2b8ca1dad447f8a"
# Choose a free tier eligible instance type
instance_type = "t2.micro"

# Give the instance a name tag
tags = {
Name = "webserver"
Description = "An Nginx Webserver on Ubuntu"
}
user_data = <<-EOF
            sudo apt update
            sudo apt install nginx -y
            systemctl enable nginx
            systemctl start nginx
            EOF
}
resource "aws_security_group" "ssh-access" {
  name = "ssh-access"
  description = "Allow SSH access from the internet"
  ingress {
    from_port = 22 
    to_port = 22 
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}