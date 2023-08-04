node {
    def dockerImage = 'node:lts-buster-slim'

    stage('Checkout') {
        checkout scm
    }

    stage('Build') {
        agent {
            docker {
                image dockerImage
                args '-p 3000:3000'
            }
        }
        environment {
            CI = 'true'
        }
        steps {
            sh 'npm install'
        }
    }

    stage('Test') {
        agent any
        steps {
            sh './jenkins/scripts/test.sh'
        }
    }

    stage('Deliver') {
        agent any
        steps {
            sh './jenkins/scripts/deliver.sh'
            input message: 'Finished using the website? (Click "Proceed" to continue)'
            sh './jenkins/scripts/kill.sh'
        }
    }
}