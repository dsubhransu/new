node {
	 
	 try{
            mv "kubectl apply -f kube-dev.yml"
         }
         
         catch(Exception e) {
             echo 'i am here'
              currentBuild.result = "FAILED"
                throw e
     } finally {
         emailext  attachLog: true, 
        body: "${currentBuild.result}: ${BUILD_URL}", 
        compressLog: false, 
        replyTo: 'somu9009@gmail.com',
        subject: currentBuild.currentResult + " : " + env.JOB_NAME, 
        to: 'somu9009@gmail.com'
         
     }
     
}
