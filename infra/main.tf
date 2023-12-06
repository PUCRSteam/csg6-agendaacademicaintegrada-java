terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.6.4"
}

provider "aws" {
    region = "us-east-1"
}

# aws_instance.CS-EC2-2:
resource "aws_instance" "CS-EC2-2" {
    ami                                  = "ami-0fc5d935ebf8bc3bc"
    associate_public_ip_address          = true
    availability_zone                    = "us-east-1a"
    disable_api_stop                     = false
    disable_api_termination              = true
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    iam_instance_profile                 = "LabInstanceProfile"
    instance_initiated_shutdown_behavior = "stop"
    instance_type                        = "t2.micro"
    key_name                             = aws_key_pair.deployer.key_name
    monitoring                           = false
    placement_partition_number           = 0
    private_ip                           = "172.31.23.196"
    secondary_private_ips                = []
    security_groups                      = [
        "launch-wizard-3",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-007a0bd2855f30111"
    tags                                 = {
        "Name"       = "CS-EC2-2"
        "codedeploy" = "producao"
    }
    tags_all                             = {
        "Name"       = "CS-EC2-2"
        "codedeploy" = "producao"
    }
    tenancy                              = "default"
    vpc_security_group_ids               = [
        "sg-008911777ce210ae2", aws_security_group.ec2-sg.id
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    cpu_options {
        core_count       = 1
        threads_per_core = 1
    }

    credit_specification {
        cpu_credits = "standard"
    }

    enclave_options {
        enabled = false
    }

    maintenance_options {
        auto_recovery = "default"
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_protocol_ipv6          = "disabled"
        http_put_response_hop_limit = 2
        http_tokens                 = "required"
        instance_metadata_tags      = "disabled"
    }

    private_dns_name_options {
        enable_resource_name_dns_a_record    = true
        enable_resource_name_dns_aaaa_record = false
        hostname_type                        = "ip-name"
    }

    root_block_device {
        delete_on_termination = true
        encrypted             = false
        tags                  = {}
        throughput            = 0
        volume_size           = 8
        volume_type           = "gp2"
    }
}

# aws_s3_bucket.codedeploy:
resource "aws_s3_bucket" "codedeploy" {
    bucket                      = "codedeploy-s3-5956"
    object_lock_enabled         = false
    tags                        = {}
    tags_all                    = {}
}

resource "aws_codedeploy_app" "codedeploy-2" {
    compute_platform    = "Server"
    name                = "codedeploy-2"
    tags                = {}
    tags_all            = {}
}

# aws_codedeploy_deployment_group.producao-2:
resource "aws_codedeploy_deployment_group" "producao-2" {
    app_name                    = "codedeploy-2"
    autoscaling_groups          = []
    deployment_config_name      = "CodeDeployDefault.AllAtOnce"
    deployment_group_name       = "producao-2"
    outdated_instances_strategy = "UPDATE"
    service_role_arn            = "arn:aws:iam::507308823394:role/LabRole"
    tags                        = {}
    tags_all                    = {}

    deployment_style {
        deployment_option = "WITHOUT_TRAFFIC_CONTROL"
        deployment_type   = "IN_PLACE"
    }

    ec2_tag_set {
        ec2_tag_filter {
            key   = "codedeploy"
            type  = "KEY_AND_VALUE"
            value = "producao"
        }
    }
}

# aws_vpc.ec2-vpc:
resource "aws_vpc" "ec2-vpc" {
    assign_generated_ipv6_cidr_block     = false
    cidr_block                           = "172.31.0.0/16"
    enable_dns_hostnames                 = true
    enable_dns_support                   = true
    enable_network_address_usage_metrics = false
    instance_tenancy                     = "default"
    tags                                 = {}
    tags_all                             = {}
}

# aws_subnet.ec2-subnet:
resource "aws_subnet" "ec2-subnet" {
    assign_ipv6_address_on_creation                = false
    availability_zone                              = "us-east-1a"
    cidr_block                                     = "172.31.16.0/20"
    enable_dns64                                   = false
    enable_resource_name_dns_a_record_on_launch    = false
    enable_resource_name_dns_aaaa_record_on_launch = false
    ipv6_native                                    = false
    map_public_ip_on_launch                        = true
    private_dns_hostname_type_on_launch            = "ip-name"
    tags                                           = {}
    tags_all                                       = {}
    vpc_id                                         = aws_vpc.ec2-vpc.id
}

# aws_security_group.ec2-sg:
resource "aws_security_group" "ec2-sg" {
    description = "launch-wizard-3 created 2023-11-16T14:43:09.212Z"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 22
            ipv6_cidr_blocks = [
                "::/0",
            ]
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 443
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 443
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 80
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 80
        },
    ]
    name        = "launch-wizard-3"
    tags        = {}
    tags_all    = {}
    vpc_id      = aws_vpc.ec2-vpc.id
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBajvaeSOoDoPqciUKD/LI4wY51RvNhbyw2yllWnYotv isragraziolagarcia@gmail.com"
}