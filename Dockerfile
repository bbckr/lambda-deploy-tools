FROM alpine:3.8
LABEL maintainer="Brianna Becker <bri@bckr.io>"

ENV TERRAFORM_VERSION="0.11.8"

# Install dependencies
RUN apk update \
    && apk add --no-cache \
      curl \
      make \
      git \
      docker \ 
      py-pip \
      python3 \
      gcc \
      py-virtualenv \
      python3-dev \
      musl-dev \
      libffi-dev \
      libressl-dev \
      nodejs \
      nodejs-npm \
    && pip install --upgrade pip \
    && pip install --no-cache-dir \
      jinja2-cli[yaml] \
    && npm install -g serverless

# Install terraform
RUN cd /tmp \
    && curl -sLo terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" \
    && unzip terraform.zip \
    && rm terraform.zip \
    && mv ./terraform /usr/local/bin 

WORKDIR /deploy

CMD sh
