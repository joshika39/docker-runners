FROM ubuntu:20.04

ARG RUNNER_VERSION
ENV DEBIAN_FRONTEND=noninteractive

LABEL Author="${AUTHOR}"
LABEL Email="${EMAIL}"
LABEL GitHub="https://github.com/${GH_PROFILE}"
LABEL BaseImage="ubuntu:20.04"
LABEL RunnerVersion=${RUNNER_VERSION}

RUN apt-get update -y && apt-get upgrade -y && useradd -m docker

RUN apt-get install -y --no-install-recommends \
    curl nodejs wget unzip vim git azure-cli jq build-essential libssl-dev libffi-dev python3 python3-venv python3-dev python3-pip docker.io

# Add the docker user to the docker group
RUN usermod -aG docker docker

RUN cd /home/docker && mkdir actions-runner && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

RUN chown -R docker:docker /home/docker/actions-runner && /home/docker/actions-runner/bin/installdependencies.sh
ADD scripts/start.sh /home/docker/start.sh

RUN chmod +x /home/docker/start.sh
USER docker
WORKDIR /home/docker/actions-runner
ENTRYPOINT ["./start.sh"]
