pipeline{
    agent any
	stages{
            ////////////////////////////////////////////////////
            stage ('Build all images and push to DockerHub') {
                steps {
                    sh 'sudo docker build -t sherazshahid017/project-be:latest ./backend/'
		    sh 'sudo docker build -t sherazshahid017/project-fe:latest ./frontend/'
		    sh 'sudo docker build -t sherazshahid017/project-db:latest ./database/'
		    sh 'sudo docker login -u sherazshahid017 -p Sshahid98'
		    sh 'sudo docker push sherazshahid017/project-app:latest' 
		    sh 'sudo docker push sherazshahid017/project-fe:latest' 
		    sh 'sudo docker push  sherazshahid017/project-db:latest'
                }
            }
	    ///////////////////////////////////////////////////
	    stage ('Kubernetes Build') {
	        steps {
		    sh 'sudo kubectl apply -f /kubernetes-files/secrets.yaml'
		}
	    }
	}
}
