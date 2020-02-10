node {
	 
	 try{
            mv "kubectl apply -f kube-dev.yml"
         }
         
         catch(err) {
             echo 'i am here'
             currentBuild.result = "FAILED"
     } finally {
        emailext  attachLog: true, 
        body: "Jenkins job for $BRANCH branch on $SPTARGET with build number (${env.BUILD_NUMBER}) is ${currentBuild.result} 	     please check the logs attached", 
        compressLog: true, 
        replyTo: 'somu9009@gmail.com',
        subject: "$SPTARGET Build status alert | ${currentBuild.result}",
        to: 'somu9009@gmail.com'
         
     }
     
}
