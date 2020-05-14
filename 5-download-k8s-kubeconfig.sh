k8sID=$(cat /root/managed-k8s/log/create-k8s-cluster.log | jq '.id'| tr -d \")
url="https://api.ionos.com/cloudapi/v5/k8s/"$k8sID"/kubeconfig"

curl -s --request GET \
     -H 'Authorization: Bearer <apiKey>' \
     --header "Content-Type: application/json" \
"$url" > /root/managed-k8s/kubeconfig-raw
cat /root/managed-k8s/kubeconfig-raw | jq '.properties.kubeconfig' | tr -d \" > /root/managed-k8s/kubeconfig.yaml
sed -i 's/\\n/\n/g' /root/managed-k8s/kubeconfig.yaml


