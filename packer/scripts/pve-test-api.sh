#!/bin/bash

# Test auth credentials
curl  --insecure --cookie "$(<cookie)" https://192.168.10.30:8006/api2/json/nodes/pve/status | jq '.'
