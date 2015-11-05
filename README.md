# kong-encode-request
Testing Kong request encoding/decoding

## Setup

    $ docker-compose up -d cassandra
    $ docker-compose up -d kong
    $ docker-compose run --rm shell ./init.sh


## Testing
    
### Direct call to echo-server

    $ docker-compose run --rm shell "curl http://echo-server:5000/echo-server/test_%2F" | jq .
```json
{
  "ip": "172.17.0.6",
  "time": 1446760411826,
  "method": "GET",
  "url": "/echo-server/test_%2F",
  "body": "",
  "headers": {
    "user-agent": "curl/7.38.0",
    "host": "echo-server:5000",
    "accept": "*/*"
  },
  "meta": {
    "num": 3,
    "live": 1,
    "status": 200,
    "delay": 0
  }
}
 ```
 
### Call to echo server through Kong API Gateway
 
    $ docker-compose run --rm shell "curl http://kong:8000/echo-server/test_%2F" | jq .
```json
{
  "ip": "172.17.0.6",
  "time": 1446760491818,
  "method": "GET",
  "url": "/echo-server/test_/",
  "body": "",
  "headers": {
    "host": "echo-server:5000",
    "connection": "close",
    "user-agent": "curl/7.38.0",
    "accept": "*/*"
  },
  "meta": {
    "num": 4,
    "live": 1,
    "status": 200,
    "delay": 0
  }
}
```

### Call to echo-server through nginx proxy


    $ docker-compose run --rm shell "curl http://nginx:5000/echo-server/test_%2F" | jq .
```json
{
  "ip": "172.17.0.4",
  "time": 1446760529151,
  "method": "GET",
  "url": "/echo-server/test_%2F",
  "body": "",
  "headers": {
    "host": "echo-server",
    "connection": "close",
    "user-agent": "curl/7.38.0",
    "accept": "*/*"
  },
  "meta": {
    "num": 5,
    "live": 1,
    "status": 200,
    "delay": 0
  }
}
```
