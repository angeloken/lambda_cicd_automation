#!/bin/bash

./config.sh --url https://github.com/angeloken/lambda_cicd_automation --token AN27UQO4CSQ77OCZ4TXYDN3GTZR42 --unattended

./svc.sh install
./svc.sh start

tail -f /dev/null