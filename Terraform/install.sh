#!/bin/bash
#########################   install jenkins   ###############################################
sudo apt update -y
sudo apt install fontconfig openjdk-21-jre -y 
java -version
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y 
sudo apt install jenkins -y 
sudo systemctl enable jenkins
sudo systemctl start jenkins

#########################   install trivy    ###################################
sudo apt-get install wget gnupg
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy -y 

########################    install docker and run sonaqube as container   ##################
sudo apt install docker.io -y 
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu
sudo chmod 777 /var/run/docker.sock
newgrp docker

docker run -d --name sonar -p 9000:9000 sonarqube:lts-community