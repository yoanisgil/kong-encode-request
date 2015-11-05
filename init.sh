#!/bin/bash

curl -X DELETE http://kong:8001/apis/echo-server
curl -X POST --url http://kong:8001/apis/ --data 'name=echo-sever' --data "upstream_url=http://echo-server:5000" --data 'request_path=/echo-server' 
