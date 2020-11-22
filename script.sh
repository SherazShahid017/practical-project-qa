#! /bin/bash

ssh -tt -i ~/.ssh/id_rsa ubuntu@18.202.167.4 << EOF

	git clone https://github.com/LukeBenson/install-scripts.git
	cd install-scripts/
	./docker_install.sh
	./docker-compose-install.sh
	cd ~
	rm -rf install-scripts/
	
	## Clone my project
	git clone https://github.com/SherazShahid017/practical-project-qa
	cd practical-project-qa/
	git checkout dev

	## Setting up mysql and running the file
	sudo apt-get update
	sudo apt install mysql-client-core-5.7

	mysql -h terraform-20201122151632162900000001.cr9zze1q6zyi.eu-west-1.rds.amazonaws.com -P 3306 -u admin -proot1234
	use testdb;
	source ~/practical-project-qa/database/Create.sql;
	exit

	## Running tests
	sudo docker-compose up -d
		
	sudo docker exec backend bash -c "pytest tests/ --cov application"
	sudo docker exec frontend bash -c "pytest tests/ --cov application"
	
EOF
