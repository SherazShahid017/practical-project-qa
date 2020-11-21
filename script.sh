#! /bin/bash

ssh 3.250.45.108 << EOF

git clone https://github.com/LukeBenson/install-scripts.git
cd install-scripts/
./docker_install.sh
./docker-compose-install.sh
cd ~
rm -rf install-scripts/


git clone https://github.com/SherazShahid017/practical-project-qa
cd practical-project-qa/
git checkout pytest
docker-compose up -d

docker exec backend bash -c "pytest tests/ --cov application"
docker exec frontend bash -c "pytest tests/ --cov application"

docker-compose down -d

EOF
