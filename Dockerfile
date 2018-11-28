FROM golang:alpine AS builder

# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git

COPY . $GOPATH/src/tagnard/zendesk_exporter/
WORKDIR $GOPATH/src/tagnard/zendesk_exporter/

# Fetch dependencies.
# Using go get.
RUN go get -d -v

# Build the binary.
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /go/bin/zendesk_exporter

FROM drone/ca-certs:latest

# Copy our static executable.
COPY --from=builder /go/bin/zendesk_exporter /zendesk_exporter

# Run the zendesk_exporter binary.
ENTRYPOINT ["/zendesk_exporter"]
