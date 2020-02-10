node {
	 
	 try{
            mv "kubectl apply -f kube-dev.yml"
         }
         
         catchError(e) {
             
              currentBuild.result = "FAILED"
             notifyFailed()
                throw e
     }
     }
     
     def notifyFailed() {
         emailext (
        attachLog: true, 
        body: "${currentBuild.result}: ${BUILD_URL}", 
        compressLog: false, 
        replyTo: 'somu9009@gmail.com',
       subject: "Build Notification: ${JOB_NAME}-Build# ${BUILD_NUMBER} ${currentBuild.result}", to: 'somu9009@gmail.com'
       )
     }

