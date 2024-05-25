pipeline {
  agent none
    stages {
        stage('Docker Build') {
            agent any
            steps {
                sh 'docker build -t netchanok97/my-python-app:latest .'
        }
        }
        stage('Docker Push') {
            agent any
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                sh 'docker push netchanok97/my-python-app:latest'
                }
        }
        }

        stage('Deploy to Kubernetes') {
              agent any
              steps {
                // คำสั่งเทสเฉยๆ
                sh 'kubectl version --client' 
                // คำสั่ง deploy ที่แท้จริง 
                // sh 'kubectl apply -f deployment.yaml' 
              }
          }
    }
}
  
