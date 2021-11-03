# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.202.5/containers/alpine/.devcontainer/base.Dockerfile

# [Choice] Alpine version: 3.14, 3.13, 3.12, 3.11
ARG VARIANT="3.14"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-alpine-${VARIANT}

# ** [Optional] Uncomment this section to install additional packages. **
# RUN apk update \
#     && apk add --no-cache <your-package-list-here>

ARG SHELLSPEC_VERSION=0.28.1
RUN mkdir -p /opt \
  && curl -SL "https://github.com/shellspec/shellspec/archive/${SHELLSPEC_VERSION}.tar.gz" \
    | tar -zxC /opt \
  && ln -s /opt/shellspec-${SHELLSPEC_VERSION}/shellspec /usr/local/bin

ARG CF_CLI_VERSION=7.3.0
RUN mkdir -p /opt/cf-cli-${CF_CLI_VERSION} \
    && curl -SL "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=${CF_CLI_VERSION}" \
      | tar -zxC /opt/cf-cli-${CF_CLI_VERSION} \
    && ln -s /opt/cf-cli-${CF_CLI_VERSION}/cf /usr/local/bin
