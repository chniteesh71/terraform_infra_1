#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    parameters {
        string(name: 'ENVIRONMENT', defaultValue: 'non-prod', description: 'Deployment environment')
    }
    stages {

        stage('Terraform Init') {
            steps {
                script {
                    if (env.ENVIRONMENT == 'prod') {
                        dir('prod') {
                            sh 'terraform init -input=false'
                        }
                    } else if (env.ENVIRONMENT == 'non-prod') {
                        dir('non-prod') {
                            sh 'terraform init -input=false'
                        }
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    if (env.ENVIRONMENT == 'prod') {
                        dir('prod') {
                            sh 'terraform plan -input=false -out=tfplan'
                        }
                    } else if (env.ENVIRONMENT == 'non-prod') {
                        dir('non-prod') {
                            sh 'terraform plan -input=false -out=tfplan'
                        }
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    if (env.ENVIRONMENT == 'prod') {
                        dir('prod') {
                            sh 'terraform apply -input=false tfplan'
                        }
                    } else if (env.ENVIRONMENT == 'non-prod') {
                        dir('non-prod') {
                            sh 'terraform apply -input=false tfplan'
                        }
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}

