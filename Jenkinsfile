pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Joel-Seba-Clitues-official/Payroll-Management-System-.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t payroll-app .'
            }
        }

        stage('Deploy with Docker') {
            steps {
                sh '''
                    docker stop payroll-container || true
                    docker rm payroll-container || true
                    docker run -d -p 8000:8000 --name payroll-container payroll-app
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Deployment successful! Visit http://44.202.101.34:8000'
        }
        failure {
            echo '❌ Deployment failed. Check the logs above.'
        }
    }
}
