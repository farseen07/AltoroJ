pipeline {
agent any

environment {
    AWS_ACCESS_KEY_ID     = credentials('AKIAU43CBKAIOG2RPBM4')
    AWS_SECRET_ACCESS_KEY = credentials('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')
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
            sh 'gradle build'
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
                sh 'ansible-playbook -i hosts deploy.yml'
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
