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

# Setup FreshRSS
bash cluster/apps/freshrss/helm.sh
kustomize build cluster/apps/freshrss | kubectl apply -f -

echo "Finished setting up cluster services!"
