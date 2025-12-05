# Homelab GitOps Cluster

## Dependencies

```
sudo dnf install python3 python3-pip cloud-utils kubectl helm
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
