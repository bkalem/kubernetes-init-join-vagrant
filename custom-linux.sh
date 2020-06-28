#!/bin/bash
echo "###############################"
echo "[Task 1] installation packagage complémentaire"
echo "###############################"
sudo yum install git vim nano wget bash-completion -y

echo "###############################"
echo "[Task 2] resolution DNS local /etc/hosts"
echo "###############################"
cat >> /etc/hosts <<EOF
172.15.20.10  master master.formini.local
172.15.20.101 worker1 worker1.formini.local
172.15.20.102 worker2 worker2.formini.local
172.15.20.103 worker3 worker3.formini.local
EOF

echo "###############################"
echo "[Task 3] enable SSH Password Authentication"
echo "###############################"
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

echo "###############################"
echo "[Task 4] reload SSHd"
echo "###############################"
sudo systemctl reload sshd

echo "###############################"
echo "[Task 5] Password root = formini"
echo "###############################"
echo "formini" | passwd --stdin root 