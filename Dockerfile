FROM golang:1.17.2

WORKDIR /go/src

RUN apt update; \
    apt install -y \
        git \
        vim \
        locales

RUN sed -i -E 's/# (ja_JP.UTF-8)/\1/' /etc/locale.gen; \
    locale-gen
ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo

ENV GO111MODULE on
RUN go get golang.org/x/tools/gopls
