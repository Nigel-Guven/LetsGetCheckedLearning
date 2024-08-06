variable sqs_sns_resources{
    description = "values for sqs and sns resources"
    type = map(object({
        environment = string
        sqs_name = string
        sns_name = string
    }))
    default = {
        "service_A" = {
            environment = "dev"
            sqs_name = "service_A"
            sns_name = "service_A_topic"
        },
        "service_B" = {
            environment = "dev"
            sqs_name = "service_B"
            sns_name = "service_B"
        }
    }
}