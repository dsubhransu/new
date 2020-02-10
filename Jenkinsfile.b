node('master') 
{   
    try 
    { 
        stage ('Checkout') 
        { 
           mv ''  
        }


        stage ('Compile')
        { 
            //All the compilation steps
        }
        
        stage ('TestRun') 
        {
            //Run all the tests
        }
    } 
    catch (err)
    {
        //Do something
        throw err
    }
    finally
    {
        stage('Email')
        {      
            emailext attachmentsPattern: 'TestResults\\*.trx',      
            body: body: "Jenkins job for master with build number (${env.BUILD_NUMBER}) is ${currentBuild.result} please check the logs attached", 
            subject: currentBuild.currentResult + " : " + env.JOB_NAME, 
            to: 'somu9009@gmail.com'
        }
    }
}
