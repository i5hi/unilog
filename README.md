# unilog

A unified log aggregation and management service that uses:

- fluentd: to parse and forward logs from various sources [@forward(like syslog), @tail(from files) .
- elasticsearch: to store and query data
- kibana: to visualize data
- nginx(certbot): to provide a http(s) entrypoint into kibana at a given domain name. eg. logs.yoursite.xyz

## run

```
docker compose up
```

## configurations

DO NOT USE IN PRODUCTION. 

You can bring in log files safely (over scp) from production servers into a local deployment of unilog for analysis.

Production ready config is in progress and will be stablized soon.

### production config requirements

- fluentd must only use `secure_forward` with a strong `shared_secret`, `authentication` and SSL/TLS `ca_cert` & `ca_key`.
- elastic search requires a multi-node configuration. Authentication must also be configured.
- kibana-es authentication must be set. TLS/SSL is required if you intend to use kibana remotely.
