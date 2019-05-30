nodepoolID=$(cat /root/managed-k8s/log/create-nodepool.log | jq '.id'| tr -d \")
k8sID=$(cat /root/managed-k8s/log/create-k8s-cluster.log | jq '.id'| tr -d \")
url="https://api.ionos.com/cloudapi/v5/k8s/"$k8sID""/nodepools/"$nodepoolID"

curl -s --request DELETE \
     -H 'Authorization: Bearer <apiKey>' \
     --header "Content-Type: application/json" \
"$url" > /root/managed-k8s/log/delete-nodepool.log
