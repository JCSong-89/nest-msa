pipeline { 
    agent {
        docker { dockerfile true }
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