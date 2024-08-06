# Description
This folder contains the code to create a SQS, SNS and a subscription using terraform and the code to create a S3 bucket and dynamodb table to version the remote state file.

You can find inside the "sqs_sns_sub" folder a module to be reused to create the AWS resources described above. The code to use the module is in the main.tf.

# How to run the remote statefile module

Go to the "static-file-iac", and run the commands below:

## localstack:

```
tflocal init

tflocal plan

tflocal apply
```

## AWS account:

```
// Set your AWS credentials using Env. Var.

terraform init

terraform plan

terraform apply
```

# How to run the main example

If you already have the terraform.tfstate in the folder you need to use the parameter "-migrate-state" to migrate the state file to remote env..

## localstack:

```
tflocal init -migrate-state

tflocal plan

tflocal apply
```

## AWS account:

```
// Set your AWS credentials using Env. Var.

terraform init -migrate-state

terraform plan

terraform apply
```