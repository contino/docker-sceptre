FROM alpine:3.8

ENV SCEPTRE_VERSION=1.4.2

RUN apk -v --no-cache add \
        python3 \
        ca-certificates \
        groff \
        less \
        bash \
        make \
        curl \
        wget \
        zip \
        git \
        && \
    pip3 install --no-cache-dir --upgrade sceptre==$SCEPTRE_VERSION && \
    update-ca-certificates

VOLUME [ "/root/.aws" ]
VOLUME [ "/opt/app" ]
WORKDIR /opt/app

CMD ["sceptre", "--version"]
