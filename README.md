# unilog

A unified log aggregation and management service that uses:

- fluentd: to parse and forward logs from various sources [@forward(like syslog), @tail(from files) .
- elasticsearch: to store and query data
- kibana: to visualize data
- nginx(certbot): to provide a http(s) entrypoint into kibana at a given domain name. eg. logs.yoursite.xyz

## run

```
# start unilog
docker compose up -d

# run a fluentd agent to send logs to unilog
cd fluentd/agent
docker build -t agent-fluentd .

./run.sh
```

## configurations

DO NOT USE IN PRODUCTION. 

You can bring in log files safely (over scp) from production servers into a local deployment of unilog for analysis.

Production ready config is in progress and will be stablized soon.

### fluentd

Two fluentd instances exist within this project: 

- server: the unilog-fluentd that recieves data only from another fluentd agent
- agent: recieves data from various sources and forwards them to unilog-fluentd

The reason for this setup is that it mimicks a production setup where unilog runs on a dedicated server and 
fluentd agents run on various host machines and forwards logs to unilog.

The agent in this repo exists only for reference. In production, it must be configured with each server according to 
the infrastructure. 

For local development, you can use the run.sh script which will attach the agent to the unilognet network so it can easily
forward logs to the server.

### production config requirements

- fluentd must only use `secure_forward` with a strong `shared_secret`, `authentication` and SSL/TLS `ca_cert` & `ca_key`.
- elastic search requires a multi-node configuration. Authentication must also be configured.
- kibana-es authentication must be set. TLS/SSL is required if you intend to use kibana remotely.
