#!/bin/bash

aws grafana update-workspace-authentication \
  --workspace-id <your-workspace-id> \
  --authentication-providers SAML \
  --saml-configuration '{ 
    "idpMetadata": {
      "url": "https://YOUR-IDP-METADATA-URL" 
    },
    "assertionAttributes": {
      "login": "email",
      "name": "name",
      "email": "email"
    }
  }'
