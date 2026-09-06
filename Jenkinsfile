pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'ap-south-1'
    }

stages {
    stage('Checkout') {
        steps {
            checkout scm
        }
    }

    stage('Build Application') {
        steps {
            sh 'gradle build -x test'
        }
    }

    stage('Ansible Syntax Check') {
        steps {
            sh 'ansible-playbook -i hosts deploy.yml --syntax-check'
        }
    }

    stage('Deploy to EC2') {
        steps {
            sshagent(['ec2-ssh-key']) {
                sh 'ansible-playbook -i hosts deploy.yml -vv'
            }
        }
    }
}

post {
    success {
        echo 'AltoroJ deployed successfully.'
    }
    failure {
        echo 'Build or deployment failed.'
    }
}
}
