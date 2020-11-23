#! /bin/bash

ssh -i ~/.ssh/id_rsa ubuntu@18.202.167.4 << EOF
	
	###################### Install docker/docker-compose ######################
	if [ ! -d install-scripts/ ]; then
		git clone https://github.com/LukeBenson/install-scripts.git
		cd install-scripts/
		./docker_install.sh
		./docker-compose-install.sh
		cd ~
		rm -rf install-scripts/
	fi


	################# Clone my project #################################
	if [ ! -d practical-project-qa/ ]; then
    	    git clone https://github.com/SherazShahid017/practical-project-qa
            cd practical-project-qa/
	fi	


	####################### Setting up mysql and running the file######################
	if ! which mysql > /dev/null; then
		sudo apt-get update
		sudo apt install mysql-client-core-5.7 -y
	fi

	mysql -h terraform-20201122151632162900000001.cr9zze1q6zyi.eu-west-1.rds.amazonaws.com -P 3306 -u admin -proot1234 < ~/practical-project-qa/database/Create.sql;
	
	mysql -h terraform-20201122151632166500000002.cr9zze1q6zyi.eu-west-1.rds.amazonaws.com -P 3306 -u admin -proot1234 < ~/practical-project-qa/database/Create.sql	
	########################### Running tests ################################
	sudo docker-compose up -d
		
	sudo docker exec backend bash -c "pytest tests/ --cov application"
	sudo docker exec frontend bash -c "pytest tests/ --cov application"
	
EOF
