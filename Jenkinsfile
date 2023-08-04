node {
    def dockerImage = 'node:lts-buster-slim'

    stage('Checkout') {
        checkout scm
    }

    stage('Build') {
        docker.image(dockerImage).inside('-p 3000:3000') {
            env.CI = 'true'
            sh 'npm install'
        }
    }

    stage('Test') {
        docker.image(dockerImage).inside('-p 3000:3000') {
            sh './jenkins/scripts/test.sh'
        }
    }

    stage('Deliver') {
        sh './jenkins/scripts/deliver.sh'
        input message: 'Finished using the website? (Click "Proceed" to continue)'
        sh './jenkins/scripts/kill.sh'
    }
}
