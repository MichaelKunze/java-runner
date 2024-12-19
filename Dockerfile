FROM mminks/dind-aech:latest

ENV LANG C.UTF-8

RUN set -exo pipefail \
    && echo "Install Java 11..." \
    && wget --directory-prefix=/etc/apk/keys https://cdn.azul.com/public_keys/alpine-signing@azul.com-5d5dc44c.rsa.pub \
    && echo "https://repos.azul.com/zulu/alpine" >> /etc/apk/repositories \
    && apk add --no-cache \
        zulu21-jdk-headless
