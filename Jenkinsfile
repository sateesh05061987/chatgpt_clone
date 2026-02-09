pipeline{
    agent any
    environment={
        OPENAI_API_KEY=credentials('OPENAI_API_KEY')    
        PORT=3000
}
    stages{
        stage('checkout'){
            steps{
                echo 'Checking out the source code...'
                git branch: 'main', url: 'https://github.com/satee/chatgpt_clone.git'
            }
        }
        stage('build docker image'){
            steps{
                echo 'Building the docker image...'
                sh 'docker build -t chatgpt-clone .' 
            }
        }
        stage('Deploy App'){
            steps{
                sh """
                docker stop chatgpt-clone-container || true
                docker rm chatgpt-clone-container || true
                docker run -d \
                --name chatgpt-clone-container \
                -p 3000:3000 \  
                -e OPENAI_API_KEY=${OPENAI_API_KEY} \
                -e PORT=${PORT} \
                 chatgpt-clone
                """
                chatgpt-clone
            }
        }
    }
}