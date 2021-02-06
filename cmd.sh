#!/bin/bash

name_secret_bigquery="serviceaccount-bigquery-storag"

name_secret_github="github_private"

#id_github = name private SSH key
id_github="636630"

#mkdir -p ./creds 

#  Add secret "SERVICEACCOUNT_bigquery" to /security/secret-manager
#  Enable "Secret Manager" in cloud-build/settings

gcloud secrets versions access latest --secret=$name_secret_bigquery --format='get(payload.data)' | tr '_-' '/+' | base64 -d > ./.environments/.serviceaccount.json

#  gcloud auth activate-service-account --key-file ./.environments/.serviceaccount.json

mkdir -p /root/.ssh

gcloud secrets versions access latest --secret=$name_secret_github --format='get(payload.data)' | tr '_-' '/+' | base64 -d > /root/.ssh/$id_github
 echo "==============1========"
 cat /root/.ssh/$id_github
 echo "============2==========="
echo "***** Set up git with key and domain ******"
chmod 600 /root/.ssh/$id_github
# ls /root/.ssh/
cat <<EOF >/root/.ssh/config
Hostname github.com
IdentityFile /root/.ssh/$id_github
EOF

ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts

#gsutil versioning set on gs://project_id-tfstate

#ls /root/.ssh/known_hosts