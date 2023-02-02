# unilog

A unified log aggregation and management service that uses:

- fluentd: to ship logs from all services to unilog.
- elasticsearch: to store and query log data
- kibana: to visualize log data
- nginx(certbot): to provide a http(s) entrypoint into kibana at a given domain name. eg. logs.yoursite.xyz

## configurations

### fluentd

All services must run a fluentd agent that forwards its logs to this service (unilog).

unilog sets a `shared_secret` that agents must use to authenticate.

Mutual TLS/SSL is enabled so logs are encrypted in transit (via nginx).

The above settings are documented here: [fluend input forward documentation.](https://docs.fluentd.org/input/forward)

### elasticsearch

### kibana

### nginx

nginx is used to redirect requests for both kibana at @443 and fluentd @22866
