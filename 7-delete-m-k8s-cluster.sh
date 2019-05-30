k8sID=$(cat /root/managed-k8s/log/create-k8s-cluster.log | jq '.id'| tr -d \")
url="https://api.ionos.com/cloudapi/v5/k8s/"$k8sID""

curl -s --request DELETE \
     -H 'Authorization: Basic bGOTI=' \
     --header "Content-Type: application/json" \
"$url" > /root/managed-k8s/log/delete-cluster.log
