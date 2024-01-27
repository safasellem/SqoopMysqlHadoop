#!/bin/bash
sudo apt-get update
sudo Docker pull mysql/mysql-server:5.6
sudo docker run -itd --name mysql mysql/mysql-server:5.6
sudo docker logs mysql
sudo docker exec -it mysql bash
sudo git clone https://github.com/Mouez2019/hadoop-sqoop-pig.git
cd hadoop-sqoop-pig
sudo docker build -t hadoop-sqoop .
sudo docker run -itd --name hadoop-sqoop hadoop-sqoop
sudo docker exec -it hadoop-sqoop bash
sudo docker network create --driver=bridge sqoop-mysql
sudo docker network connect sqoop-mysql mysql
sudo docker network connect sqoop-mysql hadoop-sqoop
sudo docker network inspect sqoop-mysql

