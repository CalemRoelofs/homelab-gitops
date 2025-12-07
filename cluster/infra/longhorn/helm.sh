#!/usr/bin/env bash 
cd "$(dirname "$0")"

set -euxo pipefail

helm repo add longhorn https://charts.longhorn.io
helm upgrade --install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace --version 1.10.1 -f values.yaml

