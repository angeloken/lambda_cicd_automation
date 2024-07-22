FROM ubuntu:20.04

ENV TZ=Asia/Jakarta
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y tzdata curl unzip python3 python3-pip awscli zip && rm -rf /var/lib/apt/lists/*

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

RUN pip3 install localstack

RUN mkdir /actions-runner

WORKDIR /actions-runner

RUN curl -o actions-runner-linux-x64-2.284.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.284.0/actions-runner-linux-x64-2.284.0.tar.gz \
    && tar xzf actions-runner-linux-x64-2.284.0.tar.gz \
    && ./bin/installdependencies.sh

COPY install-runner.sh /actions-runner/install-runner.sh
RUN chmod +x /actions-runner/install-runner.sh

ENTRYPOINT ["/actions-runner/install-runner.sh"]