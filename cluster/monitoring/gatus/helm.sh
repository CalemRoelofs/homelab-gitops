#!/usr/bin/env bash
cd "$(dirname "$0")"

set -euxo pipefail

helm repo add twin https://twin.github.io/helm-charts
helm upgrade --install --create-namespace -n monitoring gatus twin/gatus -f values.yaml
