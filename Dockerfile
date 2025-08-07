FROM jenkins/jenkins:lts

USER root 

RUN apt-get update && apt-get install -y \
  curl \
  apt-transport-https \
  ca-certificates \
  gnupg \
  lsb-release 

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
        && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

USER jenkins