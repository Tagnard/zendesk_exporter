FROM drone/ca-certs:latest
ADD zendesk_exporter /
CMD ["/zendesk_exporter"]
