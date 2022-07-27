pipeline { 
    agent {
         dockerfile true
    }
    stages{
         agent {
                dockerfile {
                filename 'Dockerfile'  
               }
        stage('init') {
            steps{
                sh 'node --version'
          }
        }    
   } 
}
