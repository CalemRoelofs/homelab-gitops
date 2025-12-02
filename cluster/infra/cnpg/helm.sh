if [[ ! $(helm repo list | grep "cnpg") ]]; then
cd "$(dirname "$0")"
    echo "Adding helm repo for cnpg"
    helm repo add cnpg https://cloudnative-pg.github.io/charts
fi

helm upgrade --install cnpg \
  --namespace cnpg-system \
  --create-namespace \
  cnpg/cloudnative-pg
