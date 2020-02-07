node {
  
   def app 
   stage('Clone repository') {
       /* Let's make sure we have the repository cloned to our workspace */     
      checkout scm
   }   
   
   stage('Build image') {
       /* This builds the actual image; synonymous to
         docker build on the command line. */          
       sh 'docker-compose up --build -d'
         /* sh 'docker build -t test .' */         
   }
   stage('Email Notification'){
      mail bcc: '', body: 'welcome to jenkins job', cc: '', from: '', replyTo: '', subject: 'report', to: 'saiprasad169@gmail.com'
   }
   
}


#node{
 #  stage('SCM Checkout'){
  #   git 'https://github.com/dsubhransu/test/new/dev'
   #}
   #stage('Compile-Package'){
    #  def mvnHome = tool name: 'maven-3', type: 'maven'
     # sh "${mvnHome}/bin/mvn package"
   #}   
   #stage('Email Notification'){
   #   mail bcc: '', body: 'welcome to jenkins job', cc: '', from: '', replyTo: '', subject: 'report', to: 'saiprasad169@gmail.com'
   #}
#}   
