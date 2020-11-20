pipeline{
    agent any
	stages{
            ////////////////////////////////////////////////////
            stage ('Build all images and push to DockerHub') {
                steps {
                    sh 'docker build -t sherazshahid017/project-be:latest ./backend/'
		    sh 'docker build -t sherazshahid017/project-fe:latest ./frontend/'
		    sh 'docker build -t sherazshahid017/project-db:latest ./database/'
		    sh 'docker login -u sherazshahid017 -p Sshahid98'
		    sh 'docker push sherazshahid017/project-be:latest' 
		    sh 'docker push sherazshahid017/project-fe:latest' 
		    sh 'docker push  sherazshahid017/project-db:latest'
                }
            }
	    ///////////////////////////////////////////////////
	    stage ('Kubernetes Build') {
	        steps {
		    sh 'cd kubernetes-files/'
		    sh 'pwd'
		    sh 'kubectl apply -f service.yaml'
		}
	    }
	}
}
