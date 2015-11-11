
#!/usr/bin/env bash

# Install Java.
echo "Installing Java..."
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get -y update
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default
echo "Java 8 installed!"

# Install Apache Tomcat.
echo "Installing Apache Tomcat..."
wget -P /tmp/ http://apache.mirrors.hoobly.com/tomcat/tomcat-8/v8.0.18/bin/apache-tomcat-8.0.18.tar.gz
tar -zxvf /tmp/apache-tomcat-8.0.18.tar.gz -C /usr/share/
echo "Apache Tomcat installed!"

# Install Git.
echo "Installing Git..."
sudo apt-get install -y git
echo "Git installed!"

# Install Maven.
echo "Installing Maven..."
sudo apt-get install -y maven
echo "Maven installed!"

# Install MongoDB.
echo "Installing MongoDB..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sed -i '/bind_ip = 127.0.0.1/,/bind_ip\ =\ 127\.0\.0\.1/s/^/#/' /etc/mongod.conf
sudo service mongod restart
echo "MongoDB installed!"
