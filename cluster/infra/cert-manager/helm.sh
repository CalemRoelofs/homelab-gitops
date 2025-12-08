#!/usr/bin/env bash 
cd "$(dirname "$0")"

set -euxo pipefail

if [[ ! $(helm repo list | grep "jetstack") ]]; then
    echo "Adding helm repo for jetstack.io"
    helm repo add jetstack https://charts.jetstack.io
    helm repo update
fi

helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.15.1 \
  --set crds.enabled=true \
  --set webhook.timeoutSeconds=4 \
  --set replicaCount=2 \
  --set podDisruptionBudget.enabled=true \
  --set podDisruptionBudget.minAvailable=1