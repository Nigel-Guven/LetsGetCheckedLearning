terraform {
    backend "s3" {
        bucket = "terraform-state-bucket"
        key    = "terraform.tfstate"
        region = "eu-west-1"
        dynamodb_table = "terraform-state-lock"
    }
}	

module "service_sqs"{

    source = "./sqs_sns_sub"

    for_each = var.sqs_sns_resources

    environment = each.value.environment
    sqs_name = each.value.environment
    sns_name = each.value.environment

    # tags = {
    #     ServiceName = each.key
    # }
}
