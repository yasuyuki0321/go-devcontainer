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

RUN go get \
    github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest \
    github.com/ramya-rao-a/go-outline@latest \
    github.com/cweill/gotests/gotests@latest \
    github.com/fatih/gomodifytags@latest \
    github.com/josharian/impl@latest \
    github.com/haya14busa/goplay/cmd/goplay@latest \
    github.com/go-delve/delve/cmd/dlv@latest \
    honnef.co/go/tools/cmd/staticcheck@latest \
    golang.org/x/tools/gopls@latest
