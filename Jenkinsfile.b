node {
     def app 
	 stage('Email Notification'){
	    mail bcc: '', body: '''Jenkins failed
            Thanks''', cc: '', from: '', replyTo: '', subject: 'TEST', to: 'gourabs864@gmail.com' 
       }
         stage('Deploy on kubernetes') {
            sh "kubectl apply -f kube-dev.yml"
         }
     catchError(message: 'failed') {
         emailext attachLog: true, body: "${currentBuild.result}: ${BUILD_URL}", compressLog: true, replyTo: 'saiprasad169@gmail.com',
       subject: "Build Notification: ${JOB_NAME}-Build# ${BUILD_NUMBER} ${currentBuild.result}", to: 'saiprasad169@gmail.com'
     }
}  
