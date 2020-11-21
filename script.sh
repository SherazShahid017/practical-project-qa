#! /bin/bash

ssh -tt -i ~/.ssh/id_rsa 34.244.3.228 << EOF

	git clone https://github.com/LukeBenson/install-scripts.git
	cd install-scripts/
	./docker_install.sh
	./docker-compose-install.sh
	cd ~
	rm -rf install-scripts/
	
	
	git clone https://github.com/SherazShahid017/practical-project-qa
	cd practical-project-qa/
	git checkout pytest
	sudo docker-compose up -d
		
	sudo docker exec backend bash -c "pytest tests/ --cov application"
	sudo docker exec frontend bash -c "pytest tests/ --cov application"
	
	sudo docker-compose down -d
	
EOF
