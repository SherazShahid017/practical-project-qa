pipeline{
    agent any
	stages{
			stage ('Install dependancies on Jenkins user') {
                steps {
				sh 'cd'
				sh 'sudo usermod -aG docker jenkins'
				}
			}
            ////////////////////////////////////////////////////
            stage ('Build all images') {
                steps {
				sh 'docker build -t sherazshahid017/project-be:latest ./backend/'
				sh 'docker build -t sherazshahid017/project-fe:latest ./frontend/'
				sh 'docker build -t sherazshahid017/project-db:latest ./database/'
                }
            }
	    ///////////////////////////////////////////////////
	    stage ('Automated Py Tests') {
			steps {
				sh 'chmod +x script.sh'
				sh './script.sh'
		}
	    }
		//////////////////////////////////////////////////
		stage ('Push images to Docker Hub') {
			steps { 
				sh 'docker push sherazshahid017/project-be:latest' 
		    		sh 'docker push sherazshahid017/project-fe:latest' 
		    		sh 'docker push  sherazshahid017/project-db:latest'
			}
		}
	    //////////////////////////////////////////////////
	    stage ('Kubernetes Build') {
	        steps {
				sh 'kubectl apply -f /var/lib/jenkins/workspace/project-pipeline/kubernetes-files/services.yaml'
				sh 'kubectl apply -f /var/lib/jenkins/workspace/project-pipeline/kubernetes-files/secrets.yaml'
				sh 'kubectl apply -f /var/lib/jenkins/workspace/project-pipeline/kubernetes-files/configmap.yaml'
				sh 'kubectl apply -f /var/lib/jenkins/workspace/project-pipeline/kubernetes-files/deploy.yaml'
		}
	    }
	    /////////////////////////////////////////////////
	}
}
