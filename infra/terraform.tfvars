project_name     = "python-microservice"
aws_region       = "us-east-1"
image_tag        = "latest"
container_port   = 5000
health_check_path = "/"

vpc_cidr        = "10.0.0.0/16"
azs             = ["us-east-1a", "us-east-1b"]
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]


