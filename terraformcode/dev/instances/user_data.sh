#! /bin/bash
sudo usermod -aG docker ec2-user
sudo yum update -y 
sudo yum install docker -y 
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo service docker start
export ECR=756055132391.dkr.ecr.us-east-1.amazonaws.com/appecr
export ECR=756055132391.dkr.ecr.us-east-1.amazonaws.com/dbecr
aws ecr get-login-password --region us-east-1 |sudo docker login -u AWS ${ECR} --password-stdin
sudo docker pull 756055132391.dkr.ecr.us-east-1.amazonaws.com/appecr:v0-app
sudo docker pull 756055132391.dkr.ecr.us-east-1.amazonaws.com/dbecr:v0-db
sudo docker network create -d bridge servicedly
