pipeline { 
    agent {
         dockerfile true
    }
    stages{

        stage('setup') {
            agent{
                docker
            }
            steps {
                sh 'apt-get update'
                sh 'apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common'
                sh 'curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -'
                sh 'add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"'
     
                sh 'apt-get update'
                sh 'apt-get -y install docker-ce'
                sh 'docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock my-container'
            }
        }

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
