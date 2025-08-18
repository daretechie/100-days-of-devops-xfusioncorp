# Notes – Day 11: Tomcat Deployment

This document provides a breakdown of the script used to install, configure, and deploy a web application on Apache Tomcat.

##  Tomcat Overview

### What is Tomcat?
Apache Tomcat is an open-source web server and servlet container developed by the Apache Software Foundation. It implements the Java Servlet, JavaServer Pages (JSP), Java Expression Language, and Java WebSocket specifications. In essence, it's a Java application that can run other Java applications.

### Why Use Tomcat?
- **Lightweight and Fast:** Tomcat is much lighter than full-fledged application servers like JBoss or WebSphere, requiring fewer resources and starting up faster.
- **Open Source and Free:** Being open-source, it's free to use, has a large community, and is highly customizable.
- **Servlet Container:** It's the official reference implementation for Java Servlet and JSP technologies, making it a popular choice for developers.
- **Flexibility:** It can be used as a standalone web server or integrated with other web servers like Apache HTTP Server.

### Common Use Cases
- **Running Java Web Applications:** Its primary use is to deploy and run Java-based web applications packaged as WAR (Web Application Archive) files.
- **Microservices:** Its lightweight nature makes it a good choice for running individual microservices.
- **Development and Testing:** Developers often use Tomcat for local development and testing of their Java web applications.

## 🚀 Script Overview

The `setup_tomcat.sh` script automates the following tasks:
1.  Installs Tomcat and its related packages.
2.  Configures Tomcat to run on a custom port.
3.  Deploys a pre-existing `.war` file.
4.  Enables and starts the Tomcat service.
5.  Performs a basic verification of the deployment.

## ✅ Prerequisites

- A `.war` file named `ROOT.war` must be present in the `/tmp` directory on the target server.

## 📜 Script Breakdown

### 1. Installation
- The script begins by installing Tomcat using `yum`:
  ```bash
  sudo yum install -y tomcat tomcat-webapps tomcat-admin-webapps
  ```

### 2. Configuration
- The default Tomcat port is changed from `8080` to `8089`.
- This is achieved by modifying the `server.xml` file using `sed`:
  ```bash
  sudo sed -i "s/Connector port=\"8080\"/Connector port=\"8089\"/" /usr/share/tomcat/conf/server.xml
  ```

### 3. Deployment
- The script deploys the application by copying the `ROOT.war` file to Tomcat's `webapps` directory.
- Naming the file `ROOT.war` makes it the default application for the server.
  ```bash
  sudo cp /tmp/ROOT.war /usr/share/tomcat/webapps/ROOT.war
  ```

### 4. Service Management
- The Tomcat service is enabled to start on boot and then restarted to apply the changes.
  ```bash
  sudo systemctl enable tomcat
  sudo systemctl restart tomcat
  ```

## 💡 Key Takeaways

- **Port Customization:** Changing the default port in `server.xml` is a common practice to avoid conflicts and enhance security.
- **Root Deployment:** Deploying an application as `ROOT.war` allows it to be accessed at the base URL (e.g., `http://<server-ip>:<port>/`), without needing a context path.
- **Service Enablement:** Using `systemctl enable` is crucial for ensuring services automatically start after a system reboot.

## 🔬 Verification

- A simple `curl` command can be used to check if the Tomcat server is running and accessible on the new port.
  ```bash
  curl -I http://stapp02:8089
  ```
- A successful deployment will return an `HTTP/1.1 200 OK` status.
