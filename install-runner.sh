#!/bin/bash
export RUNNER_ALLOW_RUNASROOT="1"
./config.sh --url https://github.com/angeloken/lambda_cicd_automation --token AN27UQNY4C2B5AZHLYSPUZTGT47NS --unattended
./run.sh