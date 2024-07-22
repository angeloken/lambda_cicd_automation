#!/bin/bash

./config.sh --url https://github.com/angeloken/lambda_cicd_automation --token AN27UQO4CSQ77OCZ4TXYDN3GTZR42 --unattended

sudo ./svc.sh install
sudo ./svc.sh start

tail -f /dev/null