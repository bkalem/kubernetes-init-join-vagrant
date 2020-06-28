#!/bin/bash
echo "###############################"
echo "[Task 1] kubernetes cluster initiation"
echo "###############################"
kubeadm init --apiserver-advertise-address=172.15.20.10 --pod-network-cidr=172.20.0.0/16

echo "###############################"
echo "[Task 2] copie de la config admin kubernetes"
echo "###############################"
# access from root user
sudo mkdir -p /root/.kube
sudo cp -i /etc/kubernetes/admin.conf /root/.kube/config
sudo chown root:root /root/.kube/config
# access from vagrant user
sudo mkdir -p /home/vagrant/.kube
sudo chown vagrant:vagrant /home/vagrant/.kube
sudo cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
sudo chown vagrant:vagrant /home/vagrant/.kube/config


echo "###############################"
echo "[Task 3] deploiment network calico"
echo "###############################"
kubectl create -f https://docs.projectcalico.org/v3.11/manifests/calico.yaml

echo "###############################"
echo "[Task 4] generation join token pour joindre les workers"
echo "###############################"
kubeadm token create --print-join-command > /root/.kube/join-kube-cluster.sh
cp /root/.kube/join-kube-cluster.sh /var/nfs-partage/join-kube-cluster.sh

echo "###############################"
echo "votre join token  /var/nfs-partage/join-kube-cluster.sh  :"
echo "###############################"
cat /var/nfs-partage/join-kube-cluster.sh