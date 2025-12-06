# Homelab GitOps Cluster

This repo is a place for me to keep my homelab configs as I learn k3s and ansible.
Currently running a single ubuntu server VM with k3s as the kubernetes runtime.

## Dependencies

The following dependencies are required.

```shell
sudo dnf install python3 python3-pip cloud-utils kubectl helm
```

I'm using [Garage](https://garagehq.deuxfleurs.fr/documentation/quick-start/) as an S3-compatible local object storage outside of the cluster.

```shell
garage -c garage.toml server
```

## Setup Ubuntu Server VM

```shell
./server/create-ubuntu-server-vm.sh
```

## Setup k3s on ubuntu node

```shell
./ansible/setups-k3s.sh
```

## Setup cluster

```shell
./cluster/setup.sh
```

## Useful plugins and tools

- [CNPG Kubectl Plugin](https://cloudnative-pg.io/documentation/1.20/kubectl-plugin/)
