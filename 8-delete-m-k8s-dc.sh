dcID=$(cat /root/managed-k8s/log/createdc.log | jq '.id'| tr -d \")
url="https://api.ionos.com/cloudapi/v5/datacenters/"$dcID""

curl -s --request DELETE \
     -H 'Authorization: Basic bGOTI=' \
     --header "Content-Type: application/json" \
"$url" > /root/managed-k8s/log/delete-dc.log
