pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Cloning my-app repository'
                sh 'ls -la'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh '''
                    echo "=== Building Docker image ==="
                    # Собираем образ с тегом build-${BUILD_NUMBER}
                    docker build -t testapp:${BUILD_NUMBER} .
                    docker tag testapp:${BUILD_NUMBER} testapp:latest
                    echo "Image built: testapp:${BUILD_NUMBER}"
                '''
            }
        }
        
        stage('Test Image') {
            steps {
                sh '''
                    echo "=== Testing Docker image ==="
                    docker run --rm testapp:${BUILD_NUMBER} echo "Container works!"
                '''
            }
        }
        
        stage('Show Images') {
            steps {
                sh '''
                    echo "=== Docker images on server ==="
                    docker images | grep testapp || echo "No images found"
                '''
            }
        }
    }
    
    post {
        success {
            echo "Pipeline completed! Image built successfully."
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
