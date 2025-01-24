pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                git url: 'https://github.com/mirosh137/git2.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the Docker image...'
                // Build the Docker image for the Flask app
                sh 'docker build -t flask-app .' 
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // Run tests inside the Docker container
                sh 'docker run --rm flask-app pytest'
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                echo 'Deploying services with Docker Compose...'
                // Deploy the application and database using Docker Compose
                sh 'docker-compose up -d'
            }
        }

        stage('Cleanup') {
            steps {
                echo 'Cleaning up Docker Compose services and resources...'
                // Bring down Docker Compose services and clean up unused resources
                sh 'docker-compose down'
                sh 'docker system prune -f'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
