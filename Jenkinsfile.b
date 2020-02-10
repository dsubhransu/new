pipeline {
    agent any
    
    stages {
        stage('Ok') {
            steps {
                mv "Ok"
            }
        }
    }
    post {
        always {
            emailext attachLog: true,
            compressLog: false,
            body: "Jenkins job for master with build number (${env.BUILD_NUMBER}) is ${currentBuild.result} please check the logs attached", 
            subject: currentBuild.currentResult + " : " + env.JOB_NAME, 
            to: 'somu9009@gmail.com'
        }
    }
}
