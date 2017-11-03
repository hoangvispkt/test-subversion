FROM debian:stretch

#Install Nginx

#Download the Nginx repository signing key
RUN sudo wget http://nginx.org/keys/nginx_signing.key

#Add the Nginx signing key to a system
RUN sudo apt-key add nginx_signing.key

#Append Nginx repository to /etc/apt/sources.list file
RUN sudo echo "deb http://nginx.org/packages/debian/ stretch nginx" | sudo tee -a /etc/apt/sources.list
RUN sudo echo "deb-src http://nginx.org/packages/debian/ stretch nginx" | sudo tee -a /etc/apt/sources.list

#Install Nginx package using the following command
RUN sudo apt-get update; apt-get -y install nginx

#Start the Nginx service after the installation
RUN sudo systemctl start nginx.service

EXPOSE 80
