
#!/usr/bin/env bash

# Install Java 8.
echo "Installing Java 8..."
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get -y update
sudo apt-get install oracle-java8-installer
echo "Setting environment variables for Java 8..."
sudo apt-get install oracle-java8-set-default

# Install Tomcat 8 web server.
echo "Installing Tomcat..."
sudo apt-get install -y tomcat8

# Install Git.
echo "Installing Git..."
sudo apt-get install -y git

# Install Maven.
echo "Installing Maven..."
sudo apt-get install -y maven
# Install Mongodb server.
echo "Installing MongoDB..."

# Add MongoDB to apt.
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/10gen.list
