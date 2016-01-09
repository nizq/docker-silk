FROM alpine:3.3

MAINTAINER nizq <ni.zhiqiang@gmail.com>

RUN echo "===> Adding compile runtime..." && \
    apk add --update bash file gcc glib-dev libc-dev libpcap-dev make pcre-dev python-dev

VOLUME ["/source"]
