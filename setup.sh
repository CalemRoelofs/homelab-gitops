#!/usr/bin/env bash
set -euxo pipefail

# Setup Headlamp
bash cluster/kube-system/headlamp/helm.sh

# Create infra namespace
kubectl apply -f cluster/infra/namespace.yaml

# Setup CNPG and databases
bash cluster/infra/cnpg/helm.sh
kustomize build cluster/infra/cnpg | kubectl apply -f -

# Setup Gatus
bash cluster/monitoring/gatus/helm.sh

# Setup Immich
kustomize build cluster/apps/immich | kubectl apply -f -
bash cluster/apps/immich/helm.sh

echo "Finished setting up cluster services!"
