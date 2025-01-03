#!/bin/bash
apt-get -y update 
apt-get -y upgrade 
apt-get -y install git 
apt-get -y install python3 
apt-get -y install  python3-pip 
pip3 install boto3
apt-get -y  install awscli 
cd /home/ubuntu/
TOKEN=$(aws --region=us-east-1 ssm get-parameter --name /chris/capstone/token --with-decryption --query 'Parameter.Value' --output text)
git clone https://$TOKEN@github.com/aredo01/capstone.git
cd /home/ubuntu/capstone
apt-get -y install python3.10-dev default-libmysqlclient-dev 
pip3 install -r requirements.txt
cd /home/ubuntu/capstone/src
python3 manage.py collectstatic --noinput
#python3 manage.py makemigrations
#python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:80