pipeline { 
    agent {
         dockerfile true
    }
    stages{
        stage('init') {
            agent {
                dockerfile {
                filename 'Dockerfile'  
               }
            }
            
            steps{
                sh 'node --version'
          }
        }    
   } 
}
