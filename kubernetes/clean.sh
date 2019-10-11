#!/bin/bash

# delete the demo minikube environment
minikube delete

rm ca.crt
rm ca.key
rm ca.srl

rm server.crt
rm server.csr
rm server.key

rm resources/webhook-configuration.yaml