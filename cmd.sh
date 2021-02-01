#!/bin/bash

name_secret_bigquery="serviceaccount-bigquery-storag"

name_secret_github="github_private"

id_github="636630"

#mkdir -p ./creds 

#  Add secret "SERVICEACCOUNT_bigquery" to /security/secret-manager
#  Enable "Secret Manager" in cloud-build/settings

gcloud secrets versions access latest --secret=$name_secret_bigquery --format='get(payload.data)' | tr '_-' '/+' | base64 -d > ./.environments/.serviceaccount.json

gcloud auth activate-service-account --key-file ./.environments/.serviceaccount.json

gcloud secrets versions access latest --secret=$name_secret_github > /root/.ssh/id_github

# ssh -T -oStrictHostKeyChecking=accept-new git@github.com || true
# return this error ===>  command-line line 0: unsupported option "accept-new".

# ssh -T -oStrictHostKeyChecking=no git@github.com || true