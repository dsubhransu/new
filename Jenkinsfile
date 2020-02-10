pipeline {
   agent any

   stages {
      stage("Git Checkout") {
         steps {
            git credentialsId: '287baab5-57d9-4de5-b33f-a15839a27107', url: 'https://github.com/dsubhransu/new.git'
         }
      }
      catch (err) { 
         currentBuild.result = 'FAILURE' 
         } 
         finally { 
            emailext attachLog: true,subject: "$SPTARGET Build status alert | ${currentBuild.result}",body: "Jenkins job for $BRANCH branch on $SPTARGET with build number (${env.BUILD_NUMBER}) is ${currentBuild.result} please check the logs attached",to: 'saiprasad169@gmail.com' 
         } 
     }
}
