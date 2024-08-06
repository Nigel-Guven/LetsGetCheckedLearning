$resellers = @(
    '2300ac7e-4bd2-489c-a55a-95a28304b6f9'
)

try{
foreach($reseller in $resellers)
{

    Write-Host "Set Patient UI Config for Reseller: $reseller"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")

$body = @"
{
    `"clientUIKey`": `"PatientPortal`",
    `"features`": {
        `"wearables`": {
            `"enabled`": false
        },       
        `"risk_score`": {
            `"enabled`": false
        },       
        `"cart_ui`": {
            `"enabled`": false
        },       
        `"health_tests_ui`": {
            `"enabled`": false
        },       
        `"reseller_logo`": {
            `"enabled`": true
        },       
        `"reseller_banner`": {
            `"enabled`": true
        },       
        `"b2b_patient_portal`": {
            `"enabled`": true
        }   
    },
    `"version`": 0
}
"@

$url = 'https://patient-ui-config-eu.letsgetchecked-stg2.com:8997/api/1/patientuiconfig/configuration/reseller/{0}' -f $reseller
$response = Invoke-RestMethod $url -Method 'PUT' -Headers $headers -Body $body
$response | ConvertTo-Json

    Write-Host "Reseller: $reseller configuration set" 
}
}
catch 
{
    Write-host -ForegroundColor Red "Failed to set reseller configuration - Encountered Error:"$_.Exception.Message
}