# VPC VARIABLES
vpc_name          = "demo-01-vpc-dev"
vpc_cidr_block    = "172.25.0.0/16"
vpc_dns_support   = true
vpc_dns_hostnames = true
vpc_tags = {
  Environment   = "dev",
  Resource-Name = "demo-01-vpc-dev"
}

# VARIABLES FOR SUBNET_PUBLIC
subnet_public_list = {
  subnet_public_01 = {
    cidr_block        = "172.25.10.0/24"
    availability_zone = "us-east-2a"
    tags = {
      Environment   = "dev",
      Resource-Name = "demo-01-subnet-public-01-dev"
    }
  }
  subnet_public_02 = {
    cidr_block        = "172.25.11.0/24"
    availability_zone = "us-east-2b"
    tags = {
      Environment   = "dev",
      Resource-Name = "demo-01-subnet-public-02-dev"
    }
  }
}
# VARIABLES FOR ROUTE_PUBLIC
route_public_cidr_block = "0.0.0.0/0"
route_public_tags = {
  Environment   = "dev",
  Resource-Name = "demo-01-route-public-dev"
}

# VARIABLES FOR INTERNET GATEWAY
igw_tags = {
  Environment   = "dev",
  Resource-Name = "demo-01-igw-dev"
}
