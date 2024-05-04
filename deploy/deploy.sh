#! /bin/bash

cd "$(dirname "$0")"

helm upgrade --install --atomic --namespace ${PROD_NAMESPACE} \
      --set regcreds=${REG_CREDS} \
      --set global.namespace=${PROD_NAMESPACE} \
      --set frontend.hostname=${PROD_DOMAIN} \
      --set frontend.tlskey=${TLS_KEY} \
      --set frontend.tlscert=${TLS_CERT} \
      momo-store .