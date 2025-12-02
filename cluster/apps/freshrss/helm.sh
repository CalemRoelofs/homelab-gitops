#!/usr/bin/env bash
cd "$(dirname "$0")"

set -euxo pipefail

helm repo add christianhuth https://charts.christianhuth.de
helm template --namespace freshrss --create-namespace freshrss christianhuth/freshrss -f values.yaml --include-crds > rendered.yaml
