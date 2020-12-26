Prometheus exporter for zendesk tickets and queue time.

## Usage

~~~ shell
docker build -t zendesk_exporter .
docker run -e ZENDESK_DOMAIN=ZENDESK_DOMAIN -e ZENDESK_EMAIL=ZENDESK_EMAIL -e ZENDESK_PASSWORD=ZENDESK_PASSWORD -p "9802:9802" zendesk_exporter
~~~

Where `ZENDESK_DOMAIN` is part of your zendesk url (https://ZENDESK_DOMAIN.zendesk.com).