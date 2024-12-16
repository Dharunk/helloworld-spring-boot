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
                sh './mvnw clean install'
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