pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x ./mvnw'
                sh './mvnw clean package -DskipTests'
            }
        }

        stage('Test') {
            steps {
                sh 'chmod +x ./mvnw'
                sh './mvnw test'
            }
        }

    }
}