pipeline {
    agent any

    environment {
        JAVA_HOME = '/usr/lib/jvm/jdk-21+35'
    }

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

    post {
        always {
            cleanWs()  // Clean the workspace after the build
        }
    }
}