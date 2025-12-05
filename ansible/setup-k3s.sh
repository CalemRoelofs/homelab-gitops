#!/usr/bin/env bash

set -euxo pipefail

cd "$(dirname "$0")"

python3 -m pip install ansible

ansible-galaxy collection install git+https://github.com/k3s-io/k3s-ansible.git

ansible-playbook k3s.orchestration.site -i inventory.yaml -kK