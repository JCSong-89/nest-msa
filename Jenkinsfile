pipeline { 
    agent {
         dockerfile true s
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
