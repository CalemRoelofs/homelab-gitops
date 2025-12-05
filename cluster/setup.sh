#!/usr/bin/env bash
set -euxo pipefail

# Setup Headlamp
bash kube-system/headlamp/helm.sh

# Create infra namespace
kubectl apply -f infra/namespace.yaml

# Setup CNPG and databases
bash infra/cnpg/helm.sh

# Wait for CNPG to finish being set up
until kubectl get svc -n cnpg-system | grep cnpg-webhook-service; do
  echo "Waiting for CNPG webhook service to be available..."
  sleep 10
done

# Apply CNPG configurations
kustomize build infra/cnpg | kubectl apply -f -

# Setup Gatus
bash monitoring/gatus/helm.sh

# Setup Immich
kustomize build apps/immich | kubectl apply -f -

until kubectl cnpg psql -n infra homelab-pg -- -d immich  -c "\d"; do
  echo "Waiting for Immich database to be ready..."
  sleep 5
done

bash apps/immich/helm.sh

echo "Finished setting up cluster services!"
