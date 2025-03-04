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
    docker.io \
    && rm -rf /var/lib/apt/lists/*


RUN groupadd docker || true && useradd -m -g docker runner && usermod -aG docker runner
USER runner

# Set the working directory
WORKDIR /actions-runner

# Download and extract the GitHub Actions runner
RUN curl -o actions-runner-linux-x64-2.303.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.303.0/actions-runner-linux-x64-2.303.0.tar.gz \
    && tar xzf actions-runner-linux-x64-2.303.0.tar.gz

# Copy the script to configure and start the runner
COPY install-runner.sh /actions-runner/install-runner.sh

# Make the script executable
#RUN chmod +x /actions-runner/install-runner.sh

# Set the entrypoint
ENTRYPOINT ["/actions-runner/install-runner.sh"]
