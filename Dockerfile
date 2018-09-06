FROM mkunze/openjdk-alpine:11 as ecr-login
RUN set -exo pipefail \
    && apk add --no-cache \
        go \
        git \
        make \
        musl-dev \
    && go get -u github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login


FROM mkunze/openjdk-alpine:11

ENV ENV=/root/.ashrc

COPY --from=ecr-login /root/go/bin/docker-credential-ecr-login /usr/local/bin/docker-credential-ecr-login
COPY bin/setup_ssh.sh /usr/local/bin

RUN set -exo pipefail \
    && apk add --no-cache \
        ca-certificates \
        openssh-client \
        python3 \
    # Setup ecr-login
    && mkdir -p /root/.docker \
    && echo "{ \"credsStore\": \"ecr-login\" }" > /root/.docker/config.json \
    # Setup ssh-agent
    && echo "eval \$(ssh-agent)" > /root/.ashrc \
    # Install aws
    && wget --output-document=/tmp/awscli-bundle.zip \
        "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" \
    && unzip /tmp/awscli-bundle.zip -d /tmp \
    && /usr/bin/python3 /tmp/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
    && rm -rf /tmp/awscli-bundle* \
    # Cleanup
    && rm -rf /var/cache/apk/*
