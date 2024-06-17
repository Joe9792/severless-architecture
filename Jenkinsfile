pipeline {
    agent any

    environment {
        // No need to pass AWS credentials here
    }

#    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-repo/serverless-architecture.git'
            }
        }

        stage('Terraform Init') {
            steps {
                withAWS(role: 'arn:aws:iam::123456789012:role/YourJenkinsRole') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withAWS(role: 'arn:aws:iam::123456789012:role/YourJenkinsRole') {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withAWS(role: 'arn:aws:iam::123456789012:role/YourJenkinsRole') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
            slackSend (channel: '#devops-team', color: 'good', message: "Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} completed successfully.")
        }
        failure {
            slackSend (channel: '#devops-team', color: 'danger', message: "Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} failed.")
        }
    }
}
