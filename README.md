# Homelab GitOps Cluster

## Setup k3s

```shell
curl -sfL https://get.k3s.io | sh -
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
```

## Setup cluster

```shell
bash setup.sh
```

## Destroy everything and uninstall k3s
```shell
/usr/local/bin/k3s-uninstall.sh
```

## Useful plugins and tools

- [CNPG Kubectl Plugin](https://cloudnative-pg.io/documentation/1.20/kubectl-plugin/)
