terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.6.5"
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
    key_name                             = "local_1"
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
        "sg-008911777ce210ae2",
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
        iops                  = 100
        tags                  = {}
        throughput            = 0
        volume_size           = 8
        volume_type           = "gp2"
    }
}

# aws_s3_bucket.codedeploy:
resource "aws_s3_bucket" "codedeploy" {
    # arn                         = "arn:aws:s3:::codedeploy-s3-5956"
    bucket                      = "codedeploy-s3-5956"
    # bucket_domain_name          = "codedeploy-s3-5956.s3.amazonaws.com"
    # bucket_regional_domain_name = "codedeploy-s3-5956.s3.us-east-1.amazonaws.com"
    # hosted_zone_id              = "Z3AQBSTGFYJSTF"
    # id                          = "codedeploy-s3-5956"
    object_lock_enabled         = false
    request_payer               = "BucketOwner"
    tags                        = {}
    tags_all                    = {}

    grant {
        id          = "f2589df62ab01a20eb1a70b9fd8617ef23917b60ee0942f347c2e3677ed4df97"
        permissions = [
            "FULL_CONTROL",
        ]
        type        = "CanonicalUser"
    }
    
    server_side_encryption_configuration {
        rule {
            bucket_key_enabled = true

            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }

    versioning {
        enabled    = false
        mfa_delete = false
    }
}