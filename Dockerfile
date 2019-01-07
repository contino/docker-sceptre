FROM alpine:3.8

ARG SCEPTRE_VERSION

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
    pip3 install --no-cache-dir --upgrade sceptre==$SCEPTRE_VERSION troposphere>=2.0.0 && \
    update-ca-certificates

VOLUME [ "/root/.aws" ]
VOLUME [ "/opt/app" ]
WORKDIR /opt/app

CMD ["sceptre", "--version"]
