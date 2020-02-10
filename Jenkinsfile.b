stage('stage name') {
            steps {
                script {
                    def status = build "kubectl apply -f kube-dev.yml" 

                    if (status != 0) {
                        // Use SUCCESS FAILURE or ABORTED
                        currentBuild.result = "FAILURE"
				emailext  attachLog: true, 
                body: "Jenkins job for master branch with build number (${env.BUILD_NUMBER}) is ${currentBuild.result},please check the logs attached", 
               compressLog: true, 
               replyTo: 'somu9009@gmail.com',
               subject: "Build status alert | ${currentBuild.result}",
               to: 'somu9009@gmail.com'
                        echo "failure"
                        throw new Exception("Throw to stop pipeline")
                        // do not use the following, as it does not trigger post steps (i.e. the failure step)
                        // error "your reason here"

                    }
                }
            }
            post {
                success {
                    script {
		    emailext  attachLog: true, 
                body: "Jenkins job for master branch with build number (${env.BUILD_NUMBER}) is ${currentBuild.result},please check the logs attached", 
               compressLog: true, 
               replyTo: 'somu9009@gmail.com',
               subject: "Build status alert | ${currentBuild.result}",
               to: 'somu9009@gmail.com'
                        echo "success"
                    }
                }
                failure {
                    script {
		    	emailext  attachLog: true, 
                body: "Jenkins job for master branch with build number (${env.BUILD_NUMBER}) is ${currentBuild.result},please check the logs attached", 
               compressLog: true, 
               replyTo: 'somu9009@gmail.com',
               subject: "Build status alert | ${currentBuild.result}",
               to: 'somu9009@gmail.com'
                        echo "failure"
                    }
                }
            }            
        }
