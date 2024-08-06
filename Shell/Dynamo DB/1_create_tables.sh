<#
    INFO:
        This script is intended for cloud environment, e.g. DEVQA where it attempts to
        create all required tables for the Conversations service
        
        For local development (localstack) let the service create its own tables
        (see the note in 1_create_tables.sh)
#>
Write-Host "Creating tables..."

### EU ###
aws dynamodb create-table `
    --table-name "salesforcecommsintegrationgateway_integration_event" `
    --attribute-definitions AttributeName=stream_id,AttributeType=S AttributeName=event_offset,AttributeType=N `
    --key-schema AttributeName=stream_id,KeyType=HASH AttributeName=event_offset,KeyType=RANGE `
    --stream-specification StreamEnabled=true,StreamViewType=NEW_IMAGE `
    --sse-specification Enabled=true,SSEType=KMS `
    --billing-mode PAY_PER_REQUEST `
    --region eu-west-1

### US ###
aws dynamodb create-table `
    --table-name "salesforcecommsintegrationgateway_integration_event" `
    --attribute-definitions AttributeName=stream_id,AttributeType=S AttributeName=event_offset,AttributeType=N `
    --key-schema AttributeName=stream_id,KeyType=HASH AttributeName=event_offset,KeyType=RANGE `
    --stream-specification StreamEnabled=true,StreamViewType=NEW_IMAGE `
    --sse-specification Enabled=true,SSEType=KMS `
    --billing-mode PAY_PER_REQUEST `
    --region us-east-1

Write-Host "Tables created."