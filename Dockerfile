FROM alpine:3.10.3

ARG TERRAFORM_VERSION=0.12.17
ARG PYTHON_VERSION=3.7.5-r1
ARG AWS_CLI_VERSION=1.16.296
ARG ANSIBLE_VERSION=2.9.2

RUN apk add --no-cache git jq less mysql-client docker && \
    apk add --no-cache python3==${PYTHON_VERSION} && \
    pip3 install awscli==${AWS_CLI_VERSION} --upgrade && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -O /tmp/terraform.zip && \
    unzip /tmp/terraform.zip -d /usr/local/bin/ && \
    rm /tmp/terraform.zip && \
    apk add --no-cache python3-dev openssl-dev gcc musl-dev libffi-dev && \
    pip3 install ansible==${ANSIBLE_VERSION}