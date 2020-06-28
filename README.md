# Prérequis 
installation de [vagrant](https://www.vagrantup.com) et [virtualbox](https://www.virtualbox.org)

[Virtualbox et Vagrant : vidéo step by step](https://www.youtube.com/watch?v=mRgiFZZG4pk)

# Création d'un cluster Kubernete
avec la commande ```vagrant up``` vous allez déployer automatiquement : 
- 01x Kubernetes Master node sous _CentOS 7_ 
- 03x Kubernetes Worker nodes sous _CentOS 7_ 

[Déploiment automatique d'un cluster Kubernetes avec vagrant : vidéo step by step](https://youtu.be/RYpEeBa6Ujw)

# Jonction automatique des workers dans le cluster
grace au serveur **NFS** présent sur le _Master_ , le token de jonction sera accessible directement au niveau des workers :) 
par conséquent à la fin du déploiment votre cluster sera operationnel avec les worker _ready_