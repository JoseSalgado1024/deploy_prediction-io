echo "###########################################"
echo "#                                         #"
echo "#        INSTALACION DE DOCKER.IO         #"
echo "#              + DEPENCIAS                #"
echo "#                                         #"
echo "#                                         #"
echo "###########################################"


#!/bib/bash
sudo apt-get update && sudo apt-get -y upgrade


# Make sure aufs support is available:
sudo apt-get -q -y install linux-image-extra-`uname -r`

# Add docker repository key to apt-key for package verification:
sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Add the docker repository to Apt sources:
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
echo "deb http://cz.archive.ubuntu.com/ubuntu trusty main" | sudo tee /etc/apt/sources.list
sudo apt-get update && sudo apt-get -y upgrade

# Update the repository with the new addition and install docker-engine:
sudo apt-get install --upgrade cgroup-lite cgroupfs-mount aufs-tools  libsystemd-journal0 && sudo apt-get update && sudo apt-get -q -y install docker-engine

# Edit UFW configuration
sudo sed 's/DEFAULT_FORWARD_POLICY="DROP"/DEFAULT_FORWARD_POLICY="ACCEPT"/g' /etc/default/ufw > /etc/default/ufw.tmp && mv /etc/default/ufw.tmp /etc/default/ufw

# Reload ufw service
sudo ufw reload

#RUN Docker as Daemon
sudo docker -d &

# Run Docker without "sudo"
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart

echo "###########################################"
echo "#                                         #"
echo "#                                         #"
echo "#    INSTALACION SERVER PREDICTION.IO     #"
echo "#          (usando Docker.io)             #"
echo "#       IMAGE: sphereio/predictionio      #"
echo "#                                         #"
echo "###########################################"

# Pull and Run dockerIMG
docker pull sphereio/predictionio
echo "Puerto de salida para server de prediction.io?"
read pio_port
docker run -it -v $HOME/MyEngine:/MyEngine -p $pio_port:8000 sphereio/predictionio /bin/bash

# Actions inside the container
# pio-start-all
# pio status
