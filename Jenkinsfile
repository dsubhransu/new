node {
  
   def app 
   stage('Clone repository') {
       /* Let's make sure we have the repository cloned to our workspace */     
      checkout scm
   }   
   stage('Email Notification'){
      mail bcc: '', body: 'welcome', cc: '', from: '', replyTo: '', subject: 'report', to: 'saiprasad169@gmail.com'   }
   }
   stage('Build image') {
       /* This builds the actual image; synonymous to
         docker build on the command line. */          
       sh 'docker-compose up --build -d'
         /* sh 'docker build -t test .' */         
   }
   stage('Email Notification'){
      mail bcc: '', body: 'welcome', cc: '', from: '', replyTo: '', subject: 'report', to: 'saiprasad169@gmail.com'   }
   }
}
