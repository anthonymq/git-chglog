FROM docker.io/golang:1.16-alpine

RUN go get github.com/git-chglog/git-chglog/cmd/git-chglog

FROM docker.io/alpine:latest

RUN apk add --no-cache git && \
    mkdir /workdir

COPY --from=0 /go/bin/git-chglog /usr/local/bin/git-chglog

WORKDIR /workdir
RUN chmod +x /usr/local/bin/git-chglog

ENTRYPOINT [ "/usr/local/bin/git-chglog" ]
CMD [ "--help" ]
