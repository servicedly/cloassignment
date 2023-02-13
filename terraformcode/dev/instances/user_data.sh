#! /bin/bash
sudo usermod -aG docker ec2-user
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo service docker start
export ECR=570629616813.dkr.ecr.us-east-1.amazonaws.com
aws ecr get-login-password --region us-east-1 |sudo docker login -u AWS ${ECR} --password-stdin
sudo docker pull 
docker network create -d bridge --subnet 10.0.0.0/24 --gateway 10.0.0.1 servicedly







sudo docker run --name mysql-db --network=customBridge -d -e MYSQL_ROOT_PASSWORD=pw $DBECR
sleep 40
sudo docker run -d --name blue -p 8081:8080  --servicedly -e APP_COLOR=$APP_COLOR -e DBHOST=$DBHOST -e DBPORT=$DBPORT -e  DBUSER=$DBUSER -e DBPWD=$DBPWD $APPECR
sudo docker run -d --name lime -p 8082:8080  --servicedly -e APP_COLOR=$APP_COLOR -e DBHOST=$DBHOST -e DBPORT=$DBPORT -e  DBUSER=$DBUSER -e DBPWD=$DBPWD $APPECR
sudo docker run -d --name pink -p 8083:8080  --servicedly -e APP_COLOR=$APP_COLOR -e DBHOST=$DBHOST -e DBPORT=$DBPORT -e  DBUSER=$DBUSER -e DBPWD=$DBPWD $APPECR