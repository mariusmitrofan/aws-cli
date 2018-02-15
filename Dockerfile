FROM alpine:3.6
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        jq \
        bash \
        && \
    pip install --upgrade pip && \
    pip install --upgrade awscli==1.11.91 s3cmd==1.6.1 python-magic==0.4.13 && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]
