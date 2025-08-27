pipeline {
    agent any

    environment {
        // Jenkins credentials IDs
        SONAR_TOKEN = credentials('squ_219f292c5a5245f5cd5f166096f95475b9ddf76f')       // SonarQube token
        AWS_ACCESS_KEY_ID = credentials('jenkins-ci-cd')   // AWS Access Key
        AWS_SECRET_ACCESS_KEY = credentials('Annur@0703')

        // Docker image settings
        IMAGE_NAME = "python-microservice"
        IMAGE_TAG = "${env.BUILD_NUMBER}"
    }

    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
        timestamps()
        ansiColor('xterm')
    }

    stages {

        stage('Checkout') {
            steps {
                echo "Checking out source code..."
                git url: 'https://github.com/Pa123313/python-microservice-cicd.git', branch: 'main'
            }
        }

        stage('Setup Python Environment') {
            steps {
                echo "Creating virtual environment and installing dependencies..."
                sh 'python3 -m venv venv'
                sh '. venv/bin/activate && pip install --upgrade pip'
                sh '. venv/bin/activate && pip install -r requirements-dev.txt'
            }
        }

        stage('Run Tests & Coverage') {
            steps {
                echo "Running pytest and generating coverage report..."
                sh '. venv/bin/activate && pytest --cov=app --cov-report=xml'
                sh 'coverage html'
            }
            post {
                always {
                    junit 'app/tests/**/*.xml'
                    archiveArtifacts artifacts: 'coverage.xml', allowEmptyArchive: true
                    archiveArtifacts artifacts: 'htmlcov/**', allowEmptyArchive: true
                }
            }
        }

        stage('Static Code Analysis - SonarQube') {
            steps {
                echo "Running SonarQube analysis..."
                sh ". venv/bin/activate && sonar-scanner -Dsonar.login=${SONAR_TOKEN}"
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Docker Image Vulnerability Scan') {
            steps {
                echo "Scanning Docker image with Trivy..."
                sh "trivy image ${IMAGE_NAME}:${IMAGE_TAG}"
            }
        }

        stage('Terraform Init & Apply') {
            steps {
                echo "Deploying infrastructure to AWS ECS..."
                dir('infra') {
                    sh 'terraform init'
                    sh "terraform apply -auto-approve -var \"image_tag=${IMAGE_TAG}\""
                }
            }
        }

        stage('Post-Deployment Verification') {
            steps {
                echo "Checking deployed service health..."
                sh 'curl -s http://<your-alb-dns-or-endpoint>:8080/health || echo "Health check failed"'
            }
        }

    }

    post {
        success {
            echo "CI/CD Pipeline completed successfully! 🎉"
        }
        failure {
            echo "CI/CD Pipeline failed. ❌"
        }
        always {
            cleanWs()
        }
    }
}

