FROM mcr.microsoft.com/devcontainers/base:ubuntu

RUN apt-get update \
    && apt-get install -y sudo curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER vscode