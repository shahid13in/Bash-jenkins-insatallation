#!/bin/bash

# Download Jenkins GPG Key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add Jenkins Repository
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list
sudo apt-get update -y

# Install Jenkins
sudo apt-get install jenkins -y

# Update package list again and install Java (OpenJDK 17)
sudo apt update -y
sudo apt install fontconfig openjdk-17-jre -y

# Verify Java installation
java -version

# Enable Jenkins service to start at boot
sudo systemctl enable jenkins

# Start Jenkins service
sudo systemctl start jenkins

# Check Jenkins service status
sudo systemctl status jenkins
