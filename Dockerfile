FROM mminks/dind-aech:latest

ARG JDK="14"
ARG BUILD="12"

ENV LANG C.UTF-8
ENV JAVA_HOME="/opt/java/current"
ENV PATH="${PATH}:${JAVA_HOME}/bin"

# Download from http://jdk.java.net

RUN set -exo pipefail \
    && wget --output-document /tmp/openjdk.tar.gz \
        https://download.java.net/java/early_access/alpine/${BUILD}/binaries/openjdk-${JDK}-ea+${BUILD}_linux-x64-musl_bin.tar.gz \
    && mkdir -p /opt/java \
    && cd /opt/java \
    && tar --extract --gzip --verbose --no-same-owner --file=/tmp/openjdk.tar.gz \
    && ln -s /opt/java/$(ls -1) /opt/java/current \
    && rm /opt/java/current/lib/src.zip \
    && rm /tmp/openjdk.tar.gz
