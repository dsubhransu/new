node {
     try{
     def app 
         stage('Deploy on kubernetes') {
            sh "kubectl apply -f kube-dev.yml"
         }
	 }
     catch(e) {
         emailext attachLog: true, body: "${currentBuild.result}: ${BUILD_URL}", compressLog: true, replyTo: 'somu9009@gmail.com',
       subject: "Build Notification: ${JOB_NAME}-Build# ${BUILD_NUMBER} ${currentBuild.result}", to: 'somu9009@gmail.com'
     }
}  
