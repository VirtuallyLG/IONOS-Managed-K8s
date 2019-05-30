# Create a new virtual data center for managed k8s

curl -s --request POST \
     -H 'Authorization: Bearer <apiKey>' \
     --header "Content-Type: application/json" \
     --data-binary '{
         "properties": {
             "name": "Managed Kubernetes-01",
             "description": "k8s data-center created via API",
             "location": "de/fra"
         }
     }' \
https://api.ionos.com/cloudapi/v5/datacenters > /root/managed-k8s/log/createdc.log

# Resource: https://api.ionos.com/cloudapi/v5/datacenters
# Method: POST
# Parameters: “name”, “description”, “location”
# Please use the name “Managed Kubernetes-xx”.
# Payload example:
# {
#   "properties": {
#     "name": "Managed Kubernetes-01",
#     "description": "Kubernetes DC",
#     "location": "de/fra"
