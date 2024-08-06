#!/bin/bash

dateUtc=$(date -u +'%FT%T.%2NZ')
dbName="dev_reseller_transactional_email_configuration"

echo "Insert reseller id (guid):"

read resellerId

# DEV
echo -e 'Login on dev env\n'

saml2aws login -a SrDev

#adding it to dev

echo -e "Inserting item $dbName\n"

aws dynamodb put-item --table-name $dbName --item '{"reseller_external_id":{"S":"'"$resellerId"'"},"dta000":{"S":"'"$dateUtc"'"},"dtb000":{"S":"'"$dateUtc"'"},"global_should_send":{"N":"0"},"specific_email_configurations":{"L":[]}}' --region eu-west-1

#validating it on dev

echo -e 'Validating it was created\n'

aws dynamodb get-item --table-name $dbName --key '{"reseller_external_id": {"S": "'"$resellerId"'"}}' --region eu-west-1

# STG
dbName="stg_reseller_transactional_email_configuration"

echo "Now going to stg. Perfoming login"

saml2aws login -a StgSrDev

# !!!! This block is repeated. The only things that differ are the --profile and dbName. Can we avoid duplicating it? !!!!
#adding it to stg

echo -e "Inserting item into $dbName\n"

aws dynamodb put-item --table-name $dbName --item '{"reseller_external_id":{"S":"'"$resellerId"'"},"dta000":{"S":"'"$dateUtc"'"},"dtb000":{"S":"'"$dateUtc"'"},"global_should_send":{"N":"0"},"specific_email_configurations":{"L":[]}}' --region eu-west-1 --profile staging

#validating it on dev

echo -e 'Validating it was created\n'

aws dynamodb get-item --table-name $dbName --key '{"reseller_external_id": {"S": "'"$resellerId"'"}}' --region eu-west-1 --profile staging



