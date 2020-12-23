FROM golang:1.10-alpine3.7 as builder

ENV CGO_ENABLED 0

RUN apk add --no-cache ca-certificates curl && \
  apk add --no-cache --virtual .build-deps git

ADD cmd/zendesk_exporter /go/src/zendesk_exporter/src
WORKDIR /go/src/zendesk_exporter/src
RUN go get -d -v
RUN go build -o /go/bin/zendesk_exporter
#RUN find /

# =============================================================================

FROM alpine:3.7
LABEL maintainer="Emil Haugbergsmyr <emil@raeven.net>"

RUN apk --no-cache add ca-certificates && update-ca-certificates

COPY --from=builder /go/bin/zendesk_exporter /bin/zendesk_exporter

EXPOSE 9802
USER nobody
ENTRYPOINT ["/bin/zendesk_exporter"]
