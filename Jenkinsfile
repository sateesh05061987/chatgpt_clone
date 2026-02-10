pipeline {
    agent any

    environment {
        OPENAI_API_KEY = credentials('OPENAI_API_KEY')
        PORT = "3000"
    }

    stages {

       
        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker image...'
                sh 'docker build -t chatgpt-clone .'
            }
        }

        stage('Deploy App') {
            steps {
                echo 'Deploying the application...'
                sh '''
                docker stop chatgpt-clone-container || true
                docker rm chatgpt-clone-container || true

                docker run -d \
                  --name chatgpt-clone-container \
                  -p 3000:3000 \
                  -e OPENAI_API_KEY=$OPENAI_API_KEY \
                  -e PORT=$PORT \
                  chatgpt_clone
                '''
            }
        }
    }
}
