pipeline {
    agent any

    tools {
        maven 'maven'   // match exactly the Maven name from Jenkins config
        jdk 'java'      // match exactly the JDK name from Jenkins config
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Joel-Seba-Clitues-official/Payroll-Management-System-.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }

        stage('Docker Build & Run') {
            steps {
                script {
                    sh '''
                        docker rm -f payroll-container || true
                        docker build -t payroll-app .
                        docker run -d -p 8000:8000 --name payroll-container payroll-app
                    '''
                }
            }
        }
    }

    post {
        always {
            junit 'target/surefire-reports/*.xml'
        }
    }
}
