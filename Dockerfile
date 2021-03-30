FROM docker.io/alpine:latest

RUN apk add --no-cache git && \
    mkdir /workdir

COPY dist/git-chglog_linux_amd64/git-chglog /usr/local/bin/git-chglog

WORKDIR /workdir
RUN chmod +x /usr/local/bin/git-chglog

ENTRYPOINT [ "/usr/local/bin/git-chglog" ]
CMD [ "--help" ]
