node {
	 
	
       def status = mv "kubectl apply -f kube-dev.yml"
           if(status != 0) {
                emailext  attachLog: true, 
                body: "Jenkins job for master branch with build number (${env.BUILD_NUMBER}) is ${currentBuild.result},please check the logs attached", 
               compressLog: true, 
               replyTo: 'somu9009@gmail.com',
               subject: "Build status alert | ${currentBuild.result}",
               to: 'somu9009@gmail.com'
           }
         
        
}
