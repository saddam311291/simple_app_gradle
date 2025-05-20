pipeline {
    agent any

    tools {
        git 'DefaultGit'
        jdk 'jdk17'
        gradle 'gradle8'  // Optional if not using wrapper
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/saddam311291/simple_app_gradle.git', branch: 'main'
            }
        }

        stage('Clean and Build') {
            steps {
                bat 'gradlew.bat clean build'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t simple_app_gradle .'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat """
                docker stop simple_app_gradle_container || echo Container not running
                docker rm simple_app_gradle_container || echo Container not found
                docker run -d --name simple_app_gradle_container -p 9091:9091 simple_app_gradle
                """
            }
        }
    }
}
