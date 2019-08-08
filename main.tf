variable "aws_key" {
  default = "/home/nikolay/AWS_key/aws_key.pem"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "security_group" {
  name = "connect"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


  resource "aws_instance" "example" {
    ami            = "ami-035b3c7efe6d061d5"
    instance_type  = "t2.micro"
    key_name       = "aws_key"
    vpc_security_group_ids = ["${aws_security_group.security_group.id}"]


    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = "${file("${var.aws_key}")}"
    }

    provisioner "file" {
      source      = "/home/nikolay/repos/terraform-file-aws/hello.sh"
      destination = "/tmp/hello.sh"
    }

    provisioner "remote-exec" {
      inline = [
	 "chmod +x /tmp/hello.sh",
	 "/tmp/hello.sh args",
      ]
  }
}

output "public_dns" { 

value = aws_instance.example.public_dns 

} 

 
