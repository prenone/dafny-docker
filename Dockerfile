ARG DOTNET_VERSION=9.0

FROM mcr.microsoft.com/dotnet/sdk:${DOTNET_VERSION} AS build

ARG DAFNY_VERSION=4.10.0
ARG DAFNY_PLATFORM=x64-ubuntu-20.04

ENV DAFNY_VERSION=${DAFNY_VERSION}
ENV DAFNY_PLATFORM=${DAFNY_PLATFORM}

RUN apt-get update && \
    apt-get install -y --no-install-recommends unzip

RUN curl -L https://github.com/dafny-lang/dafny/releases/download/v${DAFNY_VERSION}/dafny-${DAFNY_VERSION}-${DAFNY_PLATFORM}.zip \
         -o /tmp/dafny.zip && \
    unzip /tmp/dafny.zip -d /opt && \
    rm /tmp/dafny.zip

ENV PATH="/opt/dafny:${PATH}"
RUN dafny /version

RUN mkdir -p /workspace
WORKDIR /workspace
VOLUME ["/workspace"]
