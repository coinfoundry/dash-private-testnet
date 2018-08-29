#!/bin/bash

# build image
docker build -t coinfoundry/dash-private-testnet .
docker push coinfoundry/dash-private-testnet
