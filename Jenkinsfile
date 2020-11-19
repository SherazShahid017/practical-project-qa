pipeline{
    agent any
	stages{
            ////////////////////////////////////////////////////
            stage ('Build') {
                steps {
                    sh 'sudo docker build -t sherazshahid017/project-app:latest ./backend/'
		    sh 'sudo docker login -u sherazshahid017 -p Sshahid98'
		    sh 'sudo docker push sherazshahid017/project-app:latest'
                }
            }
	}
}
