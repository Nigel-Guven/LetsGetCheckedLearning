
module "service_sqs_A"{

    source = "./sqs_sns_sub"
    
    environment = "dev"
    sqs_name = "service_A"
    sns_name = "service_A"
}

module "service_sqs_B"{

    source = "./sqs_sns_sub"
    
    environment = "dev"
    sqs_name = "service_B"
    sns_name = "service_B"
}