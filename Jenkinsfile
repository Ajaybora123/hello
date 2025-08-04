pipeline{
    agent any
    environment {
        aws_access_key_id = credentials('aws_access_key_id')
       aws_secret_access_key = credentials('aws_secret_access_key')
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

