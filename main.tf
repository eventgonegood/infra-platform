#https://github.com/hashicorp/terraform/blob/master/examples/aws-two-tier/main.tf
#https://www.opencredo.com/2015/09/14/terraform-infrastructure-design-patterns/

provider "aws" {
        access_key = "${var.aws_access_key}"
        secret_key = "${var.aws_secret_key}"
        region = "${var.aws_region}"
}

resource "aws_instance" "app-server" {
        count        = "1"
        tags {
                Name = "web-${count.index}"
        }
        ami = "ami-5189a661"
        security_groups = ["public-app-servers"]
        instance_type = "t2.micro"
}

resource "aws_security_group" "public-app-servers" {
        name = "public-app-servers"
        description = "Allow HTTPS and SSH traffic"

        #HTTP
        ingress {
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        #HTTPS
        ingress {
                from_port = 443
                to_port = 443
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        #SSH
        ingress {
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        # outbound internet access
        egress {
                from_port   = 0
                to_port     = 0
                protocol    = "-1"
                cidr_blocks = ["0.0.0.0/0"]
        }

        tags {
                Name = "public-app-servers"
        }
}
