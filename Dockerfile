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
    pip install --upgrade awscli==1.14.40 s3cmd==2.0.1 python-magic==0.4.15 && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]
