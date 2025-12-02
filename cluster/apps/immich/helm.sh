#!/usr/bin/env bash
cd "$(dirname "$0")"

set -euxo pipefail

helm upgrade --install --create-namespace --namespace immich immich oci://ghcr.io/immich-app/immich-charts/immich -f values.yaml
