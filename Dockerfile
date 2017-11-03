FROM debian:stretch

RUN sudo su

#Install Docker

#Update the apt package index
RUN apt-get update

#Install packages to allow apt to use a repository over HTTPS
RUN apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common

#Add Docker’s official GPG key
RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"

#Install Docker CE
RUN apt-get update
RUN apt-get install docker-ce

#Check version Docker
RUN docker -v

#Install Nginx

#Download the Nginx repository signing key
RUN wget http://nginx.org/keys/nginx_signing.key

#Add the Nginx signing key to a system
RUN apt-key add nginx_signing.key

#Append Nginx repository to /etc/apt/sources.list file
RUN echo "deb http://nginx.org/packages/debian/ stretch nginx" | sudo tee -a /etc/apt/sources.list
RUN echo "deb-src http://nginx.org/packages/debian/ stretch nginx" | sudo tee -a /etc/apt/sources.list

#Install Nginx package using the following command
RUN apt-get update; apt-get -y install nginx

#Start the Nginx service after the installation
RUN systemctl start nginx.service

EXPOSE 22
