
# test: Flask Application Dockerization on EC2
## 📦 Overview
This project demonstrates how to containerize a Flask application using Docker and deploy it on an AWS EC2 instance. The goal is to set up a Flask app, build a Docker image, and run the application inside a container.


## ✅ Prerequisites
1. [x] Docker: Installed and configured
2. [x] AWS EC2: An active EC2 instance running.
3. [x] Git: Installed.

you can git this from the folder of ansible.

## 🔹 Getting Started

### 1. Clone the Repository:
you can clone it to your EC2 instance using
```bash
git clone https://github.com/Ibrahim-Adel15/FinalProject.git
```

### 2. Navigate to the Project Directory:
```bash
cd FinalProject
```
### 3. Create Dockerfile:
```Dockerfile
# Use Python as the base image
FROM python:3.8-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt to the container
COPY requirements.txt .

# Install required dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port 5000
EXPOSE 5000

# Run the Flask application
CMD ["python", "app.py"]
```

### 4. Building Docker Image
```bash
docker build -t flask-app .
```
This command will build the image with the name `flask-app`.
![build image](https://github.com/Mohamedmagdy220/-CloudDevOpsProject/blob/main/docker/images/docker%20build.png)
---
![build image](https://github.com/Mohamedmagdy220/-CloudDevOpsProject/blob/main/docker/images/docker%20images.png)
---

### 5. Running the Application
```bash
docker run -p 5000:5000 flask-app
```
This binds port 5000 inside the container to port 5000 on your EC2 instance, allowing you to access the application from the browser.
you can list your containers :
```bash
sudo docker container ls -a
```
![build image](https://github.com/Mohamedmagdy220/-CloudDevOpsProject/blob/main/docker/images/dockcer%20container.png)
---

### final-step: Accessing the Application

To access the application from a browser, open the browser and enter the Public IP of your EC2 instance followed by the port `5000`:

```bash
http://<Public-IP>:5000
```
![access app](https://github.com/Mohamedmagdy220/-CloudDevOpsProject/blob/main/docker/images/test%20container%20.png)
---


### 6.Additional step :Security Group Configuration

To allow external access to port 5000, you'll need to open the port in the EC2 security group.

1. Go to EC2 dashboard in the AWS console.
2. Select Security Groups from the sidebar.
3. Choose the Security Group associated with your EC2 instance.
4. Under the Inbound Rules tab, click Edit inbound rules.
5. Add a rule for Custom TCP Rule:
   - Port range: `5000`
   - Source: `0.0.0.0/0` (this allows access from any IP. You can limit this to specific IP ranges for security).
   - Click Save rules.



## Conclusion
By following the steps above, you have successfully containerized a Flask application using Docker and deployed it on an AWS EC2 instance. You can access the app via the EC2's public IP and port 5000.


🎉 **You're Done!**


## 👤 Author

Mohamed Magdy
DevOps & Cloud Enthusiast


