pipeline { 
    agent any
    stages{
        stage('setup') {
            steps {
                sh '''
                 echo "docker setup start"
                 apt-get update
                 apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
                 curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
                 add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
                 apt-get update
                 apt-get -y install docker-ce
                 docker run -d -v /var/run/docker.sock:/var/run/docker.sock my-container
                 '''
            }
        }

        stage('init') {
            agent {
                dockerfile {
                filename 'Dockerfile'  
               }
            }
            
            steps{
                sh '''
                echo "Test for Setup Completed"
                node --version
                '''
          }
        }    
   } 
}
