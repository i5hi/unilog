# unilog

A unified log aggregation and management service that uses:

- fluentd: to parse and forward logs from various sources [@forward(like syslog), @tail(from files) .
- elasticsearch: to store and query data
- kibana: to visualize data
- nginx(certbot): to provide a http(s) entrypoint into kibana at a given domain name. eg. logs.yoursite.xyz

## configurations

### fluentd

All services must run a fluentd agent that forwards its logs to this service (unilog).

unilog sets a `shared_secret` that agents must use to authenticate.

DO NOT USE IN PRODUCTION.

Mutual TLS/SSL is not stable so logs are not encrypted in transit.

The above settings are documented here: [fluend input forward documentation.](https://docs.fluentd.org/input/forward)

### elasticsearch

Single node development setup.

Security is not enabled. Not suitable for production.

Safe to use locally.

### kibana

Development setup.

