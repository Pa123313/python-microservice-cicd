# 🚀 Python Microservice CI/CD on AWS ECS with GitHub Actions

This project demonstrates how to build, containerize, and deploy a **Python microservice** onto **AWS ECS (Fargate)** using a complete **CI/CD pipeline powered by GitHub Actions**.  

It’s designed to showcase **DevOps best practices** like Infrastructure as Code, automated builds, containerization, and continuous deployment.

---

## 📌 Project Overview

- **Microservice:** A simple Python Flask application with two endpoints:
  - `/` → returns `Hello from Python microservice on ECS!`
  - `/health` → returns JSON `{"status": "ok"}`

- **Containerization:** Packaged with **Docker** and pushed to **Amazon Elastic Container Registry (ECR)**.

- **Deployment:** Hosted on **Amazon ECS (Fargate)** inside a **VPC** and exposed through a **public Application Load Balancer (ALB)**.

- **CI/CD:** Fully automated pipeline with **GitHub Actions**:
  - On each push → Code is built, containerized, pushed to ECR, and deployed to ECS.

---

## ⚙️ Tech Stack

- **Programming:** Python (Flask)
- **Containerization:** Docker
- **Cloud Provider:** AWS
  - ECS (Fargate)
  - ECR
  - IAM
  - VPC & Subnets
  - Security Groups
  - ALB
- **CI/CD:** GitHub Actions

---

**Flow:**
1. Developer pushes code to GitHub.
2. GitHub Actions workflow triggers.
3. Docker image is built and pushed to **ECR**.
4. ECS (Fargate) automatically pulls the image and redeploys the service.
5. The service is accessible via ** Public IP**.

---

## 🔑 Key Features

- **End-to-End Automation**: No manual steps needed once pipeline is set.
- **Scalable & Serverless**: Uses **AWS ECS with Fargate**, no EC2 management.
- **Health Check Endpoint**: `/health` for monitoring readiness & uptime.
- **Professional CI/CD Flow**: Recruiters can see practical DevOps implementation.

---

## 🌍 Live Test Output

After deployment, the service responds:

```bash
$ curl http://13.223.80.162:5000/
Hello from Python microservice on ECS!

$ curl http://13.223.80.162:5000/health
{"status":"ok"}


📸 Project Screenshots

Here are some key screenshots from the deployment:

GitHub Actions Workflow Successful ✅

ECS Service Running Tasks ⚡

Application Response from Browser 🌍

## Project Screenshots  

### 1. Docker Image in Amazon ECR  
![ECR Repository](images/ecr-repo.png)

### 2. ECS Cluster Running the Service  
![ECS Cluster](images/ecs-cluster.png)

### 3. ECS Task with Running Container  
![ECS Task](images/ecs-task.png)

### 4. API Test Output from Deployed Service  
![Test Output](images/test-output.png)

This project is an excellent demonstration of real-world DevOps practices:

✔️ Infrastructure as Code
✔️ Automated CI/CD pipelines
✔️ Secure & scalable AWS hosting
✔️ Monitoring endpoints for production readiness

It highlights hands-on skills with AWS, Docker, and GitHub Actions.

