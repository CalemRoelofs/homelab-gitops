#!/usr/bin/env bash 
cd "$(dirname "$0")"

set -euxo pipefail

helm repo add headlamp https://kubernetes-sigs.github.io/headlamp/
helm upgrade --install -n kube-system my-headlamp headlamp/headlamp -f values.yaml
kubectl create token my-headlamp --namespace kube-system
