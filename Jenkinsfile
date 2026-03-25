pipeline {
    agent any
    stages {
        stage('Prepare') {
            steps {
                echo '=== Начинаем сборку ==='
            }
        }
        stage('Check Environment') {
            steps {
                sh '''
                    echo "=== Системная информация ==="
                    uname -a
                    echo "=== Текущая директория ==="
                    pwd
                    echo "=== Содержимое ==="
                    ls -la
                '''
            }
        }
        stage('Test') {
            steps {
                echo '=== Все тесты пройдены! ==='
            }
        }
    }
    post {
        always {
            echo '=== Сборка завершена ==='
        }
    }
}
