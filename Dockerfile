FROM ubuntu:24.04

ARG EKSCTL_VER=v0.190.0
ARG HELM_VER=v3.16.1
ARG KUBECTL_VER=v1.30.4
ARG KUBENT_VER=0.7.3
ARG TERRAFORM_VER=1.9.5

ENV DEBIAN_FRONTEND=noninteractive
# ENV TZ=America/New_York

WORKDIR /tmp

# install dependencies/tools
RUN apt update && apt install -y \
  curl \
  dnsutils \
  git \
  groff \
  iputils-ping \
  jq \
  less \
  unzip \
  vim \
  && rm -rf /var/lib/apt/lists/*

# aws-cli2
# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#cliv2-linux-install
RUN curl -sL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip \
  && unzip -q awscliv2.zip \
  && aws/install \
  && rm -rf aws awscliv2.zip

# eksctl
# https://github.com/eksctl-io/eksctl/releases
RUN curl -sL "https://github.com/eksctl-io/eksctl/releases/download/${EKSCTL_VER}/eksctl_Linux_amd64_amd64.tar.gz" | tar xz \
  && mv eksctl /usr/local/bin

# helm3
# https://github.com/helm/helm/releases
RUN curl -sL "https://get.helm.sh/helm-${HELM_VER}-linux-amd64.tar.gz" | tar xz \
  && mv linux-amd64/helm /usr/local/bin \
  && rm -rf linux-amd64

# kubectl
# https://www.downloadkubernetes.com/
RUN curl -sLO "https://dl.k8s.io/${KUBECTL_VER}/bin/linux/amd64/kubectl" \
  && chmod +x kubectl \
  && mv kubectl /usr/local/bin

# kubent
# https://github.com/doitintl/kube-no-trouble/releases
RUN curl -sL "https://github.com/doitintl/kube-no-trouble/releases/download/${KUBENT_VER}/kubent-${KUBENT_VER}-linux-amd64.tar.gz" | tar xz \
  && chmod +x kubent \
  && mv kubent /usr/local/bin

# terraform
# https://developer.hashicorp.com/terraform/install#linux
RUN curl -sL "https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip" -o terraform.zip \
  && unzip -q terraform.zip \
  && mv terraform /usr/local/bin \
  && rm -rf terraform.zip

WORKDIR /root
