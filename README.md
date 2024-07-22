# lambda_cicd_automation

1. clone the repository:
 git clone https://github.com/angeloken/lambda-cicd-automation.git
 cd lambda-cicd-automation

2. build and run the docker container:
 docker build -t github-runner-localstack .
 docker run -it github-runner-localstack

3. start localstack:
 docker-compose up

4. push changes to trigger the workflow:
 git add .
 git commit -m "initial commit"
 git push origin main

