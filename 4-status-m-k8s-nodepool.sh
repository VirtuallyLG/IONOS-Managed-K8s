k8sID=$(cat /root/managed-k8s/log/create-k8s-cluster.log | jq '.id'| tr -d \")
url="https://api.ionos.com/cloudapi/v5/k8s/"$k8sID"/nodepools?depth=5"

curl -s --request GET \
     -H 'Authorization: Basic bOTI=' \
     --header "Content-Type: application/json" \
"$url" > /root/managed-k8s/log/create-nodepool-status.log
status=$(cat /root/managed-k8s/log/create-nodepool-status.log | jq '.items[].metadata.state'| tr -d \")

echo The current state of the NodePool is "$status"
