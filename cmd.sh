#!/bin/bash

name_secret="serviceaccount-bigquery-storag"

#mkdir -p ./creds 

#  Add secret "SERVICEACCOUNT_bigquery" to /security/secret-manager
#  Enable "Secret Manager" in cloud-build/settings

gcloud secrets versions access latest --secret=$name_secret --format='get(payload.data)' | tr '_-' '/+' | base64 -d > ./.environments/.serviceaccount.json

gcloud auth activate-service-account --key-file ./.environments/.serviceaccount.json

# ssh -T -oStrictHostKeyChecking=accept-new git@github.com || true
# return this error ===>  command-line line 0: unsupported option "accept-new".

# ssh -T -oStrictHostKeyChecking=no git@github.com || true