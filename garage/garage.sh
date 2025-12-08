#!/usr/bin/env bash
cd "$(dirname "$0")"

set -euxo pipefail

# Uncomment if setting up Garage for the first time
# NODE_ID=$(garage node id | grep '@' | cut -d'@' -f1)
# garage layout assign -z dc1 -c 10G "$NODE_ID"
# garage layout apply --version 1


# Ensure keys and buckets exist
for val in cnpg-backup longhorn; do
    if ! garage key list | grep $val; then
        garage key create $val
    fi

    if ! garage bucket list | grep $val; then
        garage bucket create $val
        garage bucket allow --read --write --owner $val --key $val
    fi
done


