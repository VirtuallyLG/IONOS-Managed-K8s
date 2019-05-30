# Create a K8S Cluster

curl -s --request POST \
     -H 'Authorization: Basic bOTI=' \
     --header "Content-Type: application/json" \
     --data-binary '{
         "properties": {
             "name": "k8s"
        }
}' \
https://api.ionos.com/cloudapi/v5/k8s > /root/managed-k8s/log/create-k8s-cluster.log

# In this step, a K8s cluster ID is generated. Master and worker nodes will be generated in the next step.

# Resource: https://api.ionos.com/cloudapi/v5/k8s
# Method: POST
# Parameters: “name”
# Payload example:
# {
#       "properties": {
#               "name": "k8s"
#       }
# }
# Response:
# {
#   "id": "1e072e52-2ed3-492f-b6b6-c6b116907637",          <--- Save this k8sID for the next step
#   "type": "k8s",
#   "href": "<RESOURCE-URI>",
#   "metadata": {
#     "...
#   },
#   "properties": {
#     "name": "k8s"
#   }
# }
