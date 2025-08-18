#!/bin/bash
# Day 11 Task 11 - Tomcat installation and deployment

# Variable
TOMCAT_PORT=8089
WAR_SOURCE="/tmp/ROOT.war"
TOMCAT_WEBAPPS="/usr/share/tomcat/webapps"
TOMCAT_CONFIG="/usr/share/tomcat/conf/server.xml"

# Install Tomcat
echo "Installing Tomcat..."
sudo yum install -y tomcat tomcat-webapps tomcat-admin-webapps

# Update port in server.xml
echo "Configuring Tomcat to run on port $TOMCAT_PORT..."
sudo sed -i "s/Connector port=\"8080\"/Connector port=\"$TOMCAT_PORT\"/" "$TOMCAT_CONFIG"

# Deploy WAR file
echo "Deploying ROOT.war..."
sudo cp "$WAR_SOURCE" "$TOMCAT_WEBAPPS/ROOT.war"

# Restart Tomcat
echo "Restarting Tomcat..."
sudo systemctl enable tomcat
sudo systemctl restart tomcat

# Verify
echo "Testing deployment..."
curl -I http://stapp02:$TOMCAT_PORT