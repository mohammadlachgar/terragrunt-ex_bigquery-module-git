#!/bin/bash

name_secret_bigquery="serviceaccount-bigquery-storag"

name_secret_github="github_private"

id_github="636630"#name private SSH key

#mkdir -p ./creds 

#  Add secret "SERVICEACCOUNT_bigquery" to /security/secret-manager
#  Enable "Secret Manager" in cloud-build/settings

gcloud secrets versions access latest --secret=$name_secret_bigquery --format='get(payload.data)' | tr '_-' '/+' | base64 -d > ./.environments/.serviceaccount.json

gcloud auth activate-service-account --key-file ./.environments/.serviceaccount.json

gcloud secrets versions access latest --secret=$name_secret_github > /root/.ssh/$id_github
 
echo "***** Set up git with key and domain ******"
chmod 600 /root/.ssh/$id_github
ls /root/.ssh/
cat <<EOF >/root/.ssh/config
Hostname github.com
IdentityFile /root/.ssh/echo"$id_github"
EOF

ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts