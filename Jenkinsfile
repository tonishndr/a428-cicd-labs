node {
    docker.image('node:lts-buster-slim').withRun('-p 3000:3000') { container ->
        env.CI = 'true'

        stage('Build') {
            sh 'npm install'
        }

        stage('Test') {
            sh './jenkins/scripts/test.sh'
        }

        stage('Deliver') {
            sh './jenkins/scripts/deliver.sh'
            input message: 'Finished using the website? (Click "Proceed" to continue)'
            sh './jenkins/scripts/kill.sh'
        }
    }
}
