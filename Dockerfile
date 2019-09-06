FROM mminks/dind-aech:latest

ENV LANG C.UTF-8
ENV JAVA_HOME="/opt/java/current"
ENV PATH="${PATH}:${JAVA_HOME}/bin"

# Download from https://www.azul.com/downloads/zulu-community/?&version=java-11-lts

RUN set -exo pipefail \
    && wget --output-document /tmp/zulu.tar.gz \
        https://cdn.azul.com/zulu/bin/zulu11.33.15-ca-jdk11.0.4-linux_musl_x64.tar.gz \
    && mkdir -p /opt/java \
    && cd /opt/java \
    && tar --extract --gzip --verbose --no-same-owner --file=/tmp/zulu.tar.gz \
    && ln -s /opt/java/$(ls -1) /opt/java/current \
    && rm /opt/java/current/lib/src.zip \
    && rm /tmp/zulu.tar.gz
