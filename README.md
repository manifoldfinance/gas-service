# Gas Service Pricing

> Gas Pricing Information Service

## Development

```bash
docker image build -t manifoldfinance/gas-service .
```

## Usage

```bash
docker container run -p 1234:80 -e ETHEREUM_URL=http://localhost:8545 manifoldfinance/gas-service
```

## Configuration

### Healthcheck

- interval - DURATION (default: 30s)
- timeout - DURATION (default: 30s)
- start-period - DURATION (default: 0s)
- retries - DURATION (default: 3)

Interval - specifies the time between the health check for the application
container. it waits for the specified time from one check to another.

Timeout - specifies the time that the health check waits for a response to
consider the status of the container. For example, if we define 30 seconds and
our server doesn’t respond within 30 seconds, then it’s considered as failed.

Start-period - specifies the number of seconds the container needs to start;
health check will wait for that time to start.

Retries - specifies the number of consecutive health check failures required to
declare the container status as unhealthy. Health check will only try up to the
specified retry number. If the server fails consecutively up to the specified
times, it is then considered unhealthy.
