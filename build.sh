CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o zendesk_exporter zendesk_exporter.go
sudo docker build --no-cache -t raeven/zendesk_exporter:latest .
