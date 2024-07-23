#!/bin/bash
export RUNNER_ALLOW_RUNASROOT="1"
./config.sh --url https://github.com/angeloken/lambda_cicd_automation --token AN27UQIENEXIUGHZRYQLB4DGT5NJM --unattended
./run.sh