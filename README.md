# kong-encode-request
Testing Kong request encoding/decoding

## Setup

    $ docker-compose up -d cassandra
    $ docker-compose up -d kong
    $ docker-compose run --rm shell ./init.sh


## Testing
    
    $ docker-compose run --rm shell "curl http://echo-server:5000/echo-server/test_%2F" | jq .
    $ docker-compose run --rm shell "curl http://kong:8000/echo-server/test_%2F" | jq .
    $ docker-compose run --rm shell "curl http://nginx:5000/echo-server/test_%2F" | jq .
