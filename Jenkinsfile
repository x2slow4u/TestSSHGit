pipeline {
    agent any
    
    environment {
        APP_NAME = 'my-app'
        DOCKER_REGISTRY = 'docker.io'  # для Docker Hub
        // IMAGE = "${DOCKER_REGISTRY}/x2slow4u/${APP_NAME}"  # раскомментировать для push
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo "Cloning ${APP_NAME} repository"
                sh 'ls -la'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh '''
                    echo "Building Docker image..."
                    docker build -t ${APP_NAME}:${BUILD_NUMBER} .
                    docker tag ${APP_NAME}:${BUILD_NUMBER} ${APP_NAME}:latest
                '''
            }
        }
        
        stage('Test Image') {
            steps {
                sh '''
                    echo "Testing image..."
                    docker run --rm ${APP_NAME}:${BUILD_NUMBER} echo "Container works!"
                '''
            }
        }
        
        stage('Show Images') {
            steps {
                sh '''
                    echo "Docker images:"
                    docker images | grep ${APP_NAME}
                '''
            }
        }
    }
    
    post {
        success {
            echo "Pipeline completed! Image: ${APP_NAME}:${BUILD_NUMBER}"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
