pipeline{
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
       aws_secret_access_key= credentials('aws_secret_access_key')
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    echo 'Checking out code...'
                    checkout scm
                }
            }
        }
        stage('Initialize') {
            steps {
                script {
                    echo 'Initializing Terraform...'
                    sh 'terraform init'
                }
            }
        }

        stage('Plan') {
            steps {
                script {
                    echo 'Planning Terraform changes...'
                    sh 'terraform plan'
                }
            }
        }

        stage('Apply') {
            steps {
                script {
                    echo 'Applying Terraform changes...'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }


}
