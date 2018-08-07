FROM alpine:3.8

ENV SCEPTRE_VERSION=1.4.0

RUN apk -v --no-cache add \
        python \
        py-pip \
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
    pip install --no-cache-dir --upgrade sceptre==$SCEPTRE_VERSION && \
    update-ca-certificates && \
    apk -v --purge del py-pip

VOLUME [ "/root/.aws" ]
VOLUME [ "/opt/app" ]
WORKDIR /opt/app

CMD ["sceptre", "--version"]
