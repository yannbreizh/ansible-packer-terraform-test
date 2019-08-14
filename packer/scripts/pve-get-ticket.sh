#!/bin/bash

# Save an authorization cookie on the hard drive
curl --silent --insecure --data "username=testuser@pve&password=test123" \
 https://192.168.43.13:8006/api2/json/access/ticket\
| jq --raw-output '.data.ticket' | sed 's/^/PVEAuthCookie=/' > cookie

# Save a CSRF token locally
curl --silent --insecure --data "username=testuser@pve&password=test123" \
 https://192.168.43.13:8006/api2/json/access/ticket \
| jq --raw-output '.data.CSRFPreventionToken' | sed 's/^/CSRFPreventionToken:/' > csrftoken
