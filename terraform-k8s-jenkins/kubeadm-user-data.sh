#!/bin/bash
apt-get update && apt-get install -y docker.io
systemctl start docker
systemctl enable docker

swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab

apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/k8s.list
apt-get update && apt-get install -y kubelet kubeadm kubectl

kubeadm init --pod-network-cidr=192.168.0.0/16

mkdir -p $HOME/.kube
cp /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

