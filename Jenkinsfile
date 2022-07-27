pipeline { 
    agent {
         dockerfile true
    }
    stages{
        stage('init') {
            steps{
                sh 'node --version'
          }
        }    
   } 
    post {
        always {
            /* clean up workspace */
            deleteDir();
        }
    }
}
