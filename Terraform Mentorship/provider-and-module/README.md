# Description
This folder contains the code to create a SQS, SNS and a subscription using terraform.

You can find inside the "sqs_sns_sub" folder a module to be reused to create the AWS resources described above. The code to use the module is in the main.tf.

# How to run

Using localstack you need to run:

```
tflocal init

tflocal plan

tflocal apply
```

In AWS you need to run:

```
// Set your AWS credentials using Env. Var.

terraform init

terraform plan

terraform apply
```