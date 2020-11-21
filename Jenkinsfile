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
		    sh 'kubectl apply -f /var/lib/jenkins/workspace/project-pipeline/kubernetes-files/services.yaml'
		    sh 'kubectl apply -f /var/lib/jenkins/workspace/project-pipeline/kubernetes-files/secrets.yaml'
		    sh 'kubectl apply -f /var/lib/jenkins/workspace/project-pipeline/kubernetes-files/configmap.yaml'
		    sh 'kubectl apply -f /var/lib/jenkins/workspace/project-pipeline/kubernetes-files/deploy.yaml'
		}
	    }
	    //////////////////////////////////////////////////
	    stage ('Automated Py Tests') {
		steps {
		    sh 'chmod +x script.sh'
		    sh './script.sh'
		}
	    }
	    /////////////////////////////////////////////////
	}
}
