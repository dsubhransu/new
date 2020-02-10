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
         emailext attachLog: true, subject: "$SPTARGET Build status alert | ${currentBuild.result}", body: "Jenkins job for $BRANCH branch on $SPTARGET with build number (${env.BUILD_NUMBER}) is ${currentBuild.result} please check the logs attached", to: 'saiprasad169@gmail.com' 
     }
}  
