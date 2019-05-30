#Create a Nodepool

dcID=$(cat /root/managed-k8s/log/createdc.log | jq '.id'| tr -d \")
k8sID=$(cat /root/managed-k8s/log/create-k8s-cluster.log | jq '.id'| tr -d \")
url="https://api.ionos.com/cloudapi/v5/k8s/"$k8sID"/nodepools"

curl -s --request POST \
     -H 'Authorization: Basic bGOTI=' \
     --header "Content-Type: application/json" \
     --data-binary '{
	"properties": {
    "name": "k8s-node-pool",
    "datacenterId": "'"$dcID"'",
    "nodeCount": 2
  }
}' \
"$url" > /root/managed-k8s/log/create-nodepool.log

# in his step, master and worker nodes are provisioned. The datacenterId must be provided.

#Resource: https://api.ionos.com/cloudapi/v5/k8s/<k8sID>/nodepools
#Method: POST
#Parameters: “name”, “datacenterId”, “nodeCount”
#Payload example:
#{
#  "properties": {
#    "name": "k8s-node-pool",
#    "datacenterId": "<datacenterId>",
#    "nodeCount": 2
#  }
#}
#Response:
#{
#  "id": "1e072e52-2ed3-492f-b6b6-c6b116907788",
#  "type": "nodepool",
#  "href": "<RESOURCE-URI>",
#  "metadata": {
#   ...
#    "state": "BUSY"
#  },
#  "properties": {
#    "name": "k8s-node-pool",
#    "datacenterId": "ab6d4aea-bb90-45f7-88dd-e7c77883a9bd",
#    "nodeCount": 2
#  }
#}

