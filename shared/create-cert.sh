#!/bin/bash

KEY_NAME="traefik"
DOMAINNAME="docker.localhost"
DIR_PLACE="cert"
FILE="traefik.key"


if [[ -e /cert/"$FILE" && ! -L /cert/$FILE ]]; then
   echo "key exist"
else
   openssl req \
    -newkey rsa:2048 \
    -x509 \
    -nodes \
    -keyout /${DIR_PLACE}/${KEY_NAME}.key \
    -new \
    -out /${DIR_PLACE}/${KEY_NAME}.crt \
    -subj /CN=\*.${DOMAINNAME} \
    -days 365 && echo "Created ${KEY_NAME}.key"

fi

