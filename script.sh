#! /bin/bash

ssh -tt -i ~/.ssh/id_rsa ubuntu@34.244.3.228 << EOF

	git clone https://github.com/LukeBenson/install-scripts.git
	cd install-scripts/
	./docker_install.sh
	./docker-compose-install.sh
	cd ~
	rm -rf install-scripts/
	
	## Clone my project
	git clone https://github.com/SherazShahid017/practical-project-qa
	cd practical-project-qa/
	git checkout pytest

	## Setting up mysql and running the file
	sudo apt-get update
	sudo apt install mysql-client-core-5.7

	mysql -h endpoint -u admin -proot1234 << EOF
		use testdb;
		source ~/practical-project-qa/database/Create.sql
		exit
	EOF

	## Running tests
	sudo docker-compose up -d
		
	sudo docker exec backend bash -c "pytest tests/ --cov application"
	sudo docker exec frontend bash -c "pytest tests/ --cov application"
	
EOF
