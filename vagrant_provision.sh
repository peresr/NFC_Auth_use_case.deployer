#!/usr/bin/env bash

# Install Java.
echo "Installing Java..."
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer
sudo apt-get install oracle-java8-set-default
echo "Java 8 installed!"

# Install Apache Tomcat.
echo "Installing Apache Tomcat..."
wget -P /tmp/ http://apache.mirrors.hoobly.com/tomcat/tomcat-8/v8.0.28/bin/apache-tomcat-8.0.28.tar.gz
sudo tar -zxvf /tmp/apache-tomcat-8.0.28.tar.gz -C /usr/share/
rm /tmp/apache-tomcat-8.0.28.tar.gz
export CATALINA_HOME=/usr/share/apache-tomcat-8.0.28
echo "Apache Tomcat installed!"

# Install Maven.
echo "Installing Maven..."
sudo apt-get install -y maven
echo "Maven installed!"

# Install MongoDB.
echo "Installing MongoDB..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo mkdir /data
sudo mkdir /data/db
echo "MongoDB installed!"

# Clone portal from Git repository.
echo "Cloning NFC_Auth_use_case.web_portal repository..."
sudo git clone https://github.com/peresr/NFC_Auth_use_case.web_portal.git /tmp/
echo "NFC_Auth_use_case.web_portal repository cloned!"

# Packaging portal.
sudo mvn package

# Starting MongoDB.
echo "Starting MongoDB deamon..."
sudo mongod --fork --logpath /var/log/mongodb.log
echo "MongoDB deamon started!"

# Starting Apache Tomcat.
echo "Starting Apache Tomcat server..."
sudo $CATALINA_HOME/bin/startup.sh
echo "Apache Tomcat server started!"
