FROM ubuntu:20.04

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    tar \
    python3 \
    python3-pip \
    awscli \
    zip \
    curl \
    sudo \
    git \
    iptables \
    ca-certificates \
    lsb-release \
    apt-transport-https \
    software-properties-common \
    gnupg2 \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

# Create a Docker group and add the user
RUN groupadd -f docker
RUN useradd -m runner && usermod -aG docker runner
# Create a new user
RUN useradd -ms /bin/bash github-actions

# Install Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

# Set the working directory
WORKDIR /actions-runner

# Download and extract the GitHub Actions runner
RUN curl -o actions-runner-linux-x64-2.303.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.303.0/actions-runner-linux-x64-2.303.0.tar.gz \
    && tar xzf actions-runner-linux-x64-2.303.0.tar.gz

# Copy the script to configure and start the runner
COPY install-runner.sh /actions-runner/install-runner.sh

# Make the script executable
RUN chmod +x /actions-runner/install-runner.sh

# Set the entrypoint
ENTRYPOINT ["/actions-runner/install-runner.sh"]
